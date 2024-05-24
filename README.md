
# Workflows Atomation and CI/CD integration 

How to automate Databricks workflow deployments and integrate with your CI/CD pipeline.

## Workflows Atomation
There are different ways you can automate the workflows deployments.


- Databricks Asset bundles (Yaml Based)
- PyDabs (Python version of Databricks Asset Bundles)
- Databricks Terraform Provider
- Python SDK
- Rest API

The repo contains examples of automating your workflows using

([Databricks Asset Bundles](https://docs.databricks.com/en/dev-tools/bundles/index.html)

The job definition part under dab_resources folder has examples of deploying diferent Job types in databricks workflows.

        - Delta Live Table pipeline
        - DBT pipeline
        - Wheel file dependency from Unity Catalog Volumes
 

([Terraform](https://registry.terraform.io/providers/databricks/databricks/latest/docs))


The terraform code under terraform/modules/workflows has examples of deploying the above jobs using Terraform scripts. 

PyDabs (Private Preview)

The pydabs code under src/jobs are used to generate the corresponding YML file to be deployed as part of the asset bundle deployment.

## CI/CD integration 

The repo has examples fo integrating with different CI/CD platforms 


Azure Devops

There are three pipelines defined for Azure Devops integration

   - Deploying a Databricks Asset bundles based workflows to databricks -  azure-pipelines-dab.yml
   - Deploying a Terraform based workflows to databricks -  azure-pipelines-tf.yml
   - Deploying a pipeline to run pytests -  azure-pipelines-testcase.yml


Github Actions

There are two pipelines defined for Github Actions integration

   - Deploying a Databricks Asset bundles based workflows to databricks -  .github/workflows/dabs_qa.yml
   - Deploying a Terraform based workflows to databricks -  .github/workflows/tf_qa.yml



[Local Environment set up ](localSetup.md)




[Azure Devops Deployment](Azuredevops.md)