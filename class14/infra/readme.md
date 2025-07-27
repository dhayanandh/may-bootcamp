# Terraform Commands for Initialization and Apply

Below are the commands to initialize and apply Terraform configuration using variable and backend files located in the `/vars` folder.

### Initialize Terraform
```bash
terraform init -backend-config=vars/dev.tfbackend
```

### Plan Terraform Configuration
```bash
terraform plan -var-file=vars/dev.tfvars
```

### Apply Terraform Configuration
```bash
terraform apply -var-file=vars/dev.tfvars
```


## prod 

### Initialize Terraform
```bash
terraform init -backend-config=vars/prod.tfbackend
```

```bash
terraform plan -var-file=vars/prod.tfvars
```

### Apply Terraform Configuration
```bash
terraform apply -var-file=vars/prod.tfvars
```

### Notes:
- Ensure the `vars/backend.tfvars` file contains backend configuration details.
- Ensure the `vars/variables.tfvars` file contains variable definitions required by your Terraform configuration.
- Run these commands from the directory containing your Terraform configuration files.
