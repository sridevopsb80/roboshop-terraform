

if [ $# -ne 2 ]; then #2 arguments are expected for env and action. if it is not provided
  echo "$0 env(dev|prod) action(apply|destroy)" # $0-run.sh, $1-dev/prod, $2- apply/destroy
  exit 1
fi
git pull
rm -rf .terraform
terraform init -backend-config=env-${1}/state.tfvars
terraform $2 -var-file=env-${1}/main.tfvars -auto-approve



