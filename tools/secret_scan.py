"""Refuse secrets in the repository: API keys, private keys, passwords, bank and card numbers.

Usage: python3 tools/secret_scan.py [files...]   (default: every file tracked by git)
Exit code 1 and the list of findings if anything looks like a secret. No dependency.
"""

import re
import subprocess
import sys

# Formats with a fixed prefix: almost no false positives.
TOKENS = {
    "private key": re.compile(r"-----BEGIN [A-Z ]*PRIVATE KEY-----"),
    "AWS key": re.compile(r"\b(AKIA|ASIA)[0-9A-Z]{16}\b"),
    "GitHub token": re.compile(
        r"\b(gh[pousr]_[A-Za-z0-9]{36,}|github_pat_[A-Za-z0-9_]{60,})\b"
    ),
    "Anthropic/OpenAI key": re.compile(r"\bsk-(ant-)?[A-Za-z0-9_-]{20,}"),
    "Slack token": re.compile(r"\bxox[abprs]-[A-Za-z0-9-]{10,}"),
    "Google API key": re.compile(r"\bAIza[0-9A-Za-z_-]{35}\b"),
    "JWT": re.compile(
        r"\beyJ[A-Za-z0-9_-]{10,}\.eyJ[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}"
    ),
}
# A password or key followed by its value (keyword, then ":" or "=", then 6+ characters).
ASSIGNED = re.compile(
    r"(?i)\b(password|passwd|mot de passe|mdp|api[_-]?key|secret|token|cl[ée] api)\b"
    r"\s*[:=]\s*[\"']?[^\s\"'<>`]{6,}"
)
IBAN = re.compile(r"\b[A-Z]{2}\d{2}(?: ?[A-Z0-9]{4}){3,7}\b")
CARD_LIKE = re.compile(r"\b(?:\d[ -]?){13,19}\b")
URL = re.compile(r"https?://\S+")
# The tests hold fake secrets on purpose.
IGNORED = {"tools/test_secret_scan.py"}
SECRET_QUERY = re.compile(
    r"[?&](token|key|apikey|sig|signature|auth|password)=[^&\s]{8,}", re.IGNORECASE
)


def luhn(number: str) -> bool:
    digits = [int(d) for d in re.sub(r"\D", "", number)][::-1]
    total = sum(
        d if i % 2 == 0 else (d * 2 - 9 if d > 4 else d * 2)
        for i, d in enumerate(digits)
    )
    return total % 10 == 0


def scan_text(text: str) -> list[str]:
    """Return the kinds of secret found in the text (empty list if clean)."""
    found = [name for name, pattern in TOKENS.items() if pattern.search(text)]
    if ASSIGNED.search(text):
        found.append("password or key with a value")
    if any(SECRET_QUERY.search(url) for url in URL.findall(text)):
        found.append("link carrying a token")
    without_urls = URL.sub("", text)
    if IBAN.search(without_urls):
        found.append("IBAN")
    if any(luhn(m.group()) for m in CARD_LIKE.finditer(without_urls)):
        found.append("card number")
    return found


def tracked_files() -> list[str]:
    out = subprocess.run(
        ["git", "ls-files"], capture_output=True, text=True, check=True
    ).stdout
    return out.splitlines()


def main(paths: list[str]) -> int:
    problems = 0
    for path in paths or tracked_files():
        if path in IGNORED:
            continue
        try:
            with open(path, encoding="utf-8") as f:
                lines = f.readlines()
        except (UnicodeDecodeError, IsADirectoryError, FileNotFoundError):
            continue
        for number, line in enumerate(lines, 1):
            for kind in scan_text(line):
                print(f"{path}:{number}: {kind}")
                problems += 1
    if problems:
        print(f"\n{problems} possible secret(s). Remove them, and rotate any real key.")
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
