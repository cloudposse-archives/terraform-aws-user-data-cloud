
##############
# Install deps
##############

apt-get -y install python-pip

# Install AWS Client
pip install --upgrade awscli

##
## Makefile for cloud commands
##
cat <<"__EOF__" > /usr/local/include/Makefile.cloud
REGION ?= "${region}"
STAGE ?= "${stage}"
NAMESPACE ?= "${namespace}"

.PHONY : list-instances
## List instances
list-instances:
	@aws ec2 describe-instances \
	--filters Name=tag:Stage,Values=$(STAGE) Name=tag:Namespace,Values=$(NAMESPACE) \
	--region $(REGION) | jq \
	".Reservations[].Instances[] |  \"Id: \(.InstanceId), Type: \(.InstanceType),  Name: \( .Tags[] | select( .Key == \"Name\" ) | .Value ), State: \(.State.Name), KeyPair: \(.KeyName), PrivateIp: \(.PrivateIpAddress), PublicIp: \(.PublicIpAddress)\""

.PHONY : list-instances-raw
## List instances in json format
list-instances-raw:
	@aws ec2 describe-instances \
	--filters Name=tag:Stage,Values=$(STAGE) Name=tag:Namespace,Values=$(NAMESPACE) \
	--region $(REGION)

__EOF__
chmod 644 /usr/local/include/Makefile.cloud
