## Environment set up locally 

Create a virtual env
```
virtualenv .venv
```

To activate the virtual environment,
```
. .venv/bin/activate

```

### Set up Databricks CLI locally

Install databricks cli

 
[For mac](https://docs.databricks.com/en/dev-tools/cli/install.html)
```
brew tap databricks/tap
brew install databricks
```
[Authenticate using Oauth](https://docs.databricks.com/en/dev-tools/cli/authentication.html#oauth-user-to-machine-u2m-authentication)
```
databricks auth login --host <workspace-url>
```


### Set up DBT core locally in your laptop


[Install dbt](https://learn.microsoft.com/en-us/azure/databricks/partners/prep/dbt)
```
Install the `dbt-databricks` package using pip


Make sure to use python 3.9
Install pipenv - pip install pipenv
Run - pipenv install

```

sample profiles.yml for [dbt with oauth](https://community.databricks.com/t5/technical-blog/using-dbt-core-with-oauth-on-azure-databricks/ba-p/46605)


```
default:
  target: dev
  outputs:
    dev:
      type: databricks
      catalog: sales_dbt_dev
      schema: sales
      host: workspace.azuredatabricks.net
      http_path: /sql/1.0/warehouses/warehouse-id
      auth_type: oauth
      client_id: clientid

```     

### Running DBT job locally


Local path to profiles.yml can be passed when running locally.

- dbt deps
- dbt build  --profiles-dir=/Users/kiran.sreekumar/.dbt/



### Deploy as workflow in the configured databricks workspace using DAB

- databricks bundle validate
- databricks bundle deploy





### Set up Terraform locally


Install terraform cli

[For mac](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

- brew tap hashicorp/tap
- brew install hashicorp/tap/terraform

[Authenticate](https://registry.terraform.io/providers/databrickslabs/databricks/latest/docs#authentication) using the databrickscfg profile.


### Deploy as workflow in the configured databricks workspace using Terraform


To run locally, rename the file override.tf.example to override.tf


```     
cd terraform/modules/workflows
terraform init
terraform validate
terraform plan
terraform apply
```     