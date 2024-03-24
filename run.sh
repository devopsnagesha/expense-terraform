env=$1
action=$2

if [ -z $env ]; then
  echo "Input env(dev|qa|state|prod) missing"
  exit 1
fi

if [ -z $action ]; then
  echo "Input action (apply|destroy) missing"
  exit 2
fi

rm-rf .terraform/terraform.tf.tfstate
terraform init -backend-config=env-$env/state.tfvars
terrafrom apply $action -var-file=env-$env/main.tfvars