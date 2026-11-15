# EC2 shortcuts
alias ec2ls='aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,State.Name,Tags[?Key==`Name`].Value|[0]]" --output table'
alias ec2running='aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value|[0]]" --output table'

# S3 shortcuts
alias s3ls='aws s3 ls'
alias s3sync='aws s3 sync'

# IAM shortcuts
alias awsme='aws sts get-caller-identity'
alias awsprofile='echo $AWS_PROFILE'

# CloudFormation
alias cfls='aws cloudformation list-stacks'
alias cfstatus='aws cloudformation describe-stacks'
