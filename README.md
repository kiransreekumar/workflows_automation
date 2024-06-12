
# Databricks Workflows Atomation and CI/CD integration 

How to automate Databricks workflow deployments and integrate with your CI/CD pipeline.

## Workflows Atomation
There are different ways you can automate the workflows deployments.


- Databricks Asset bundles (Yaml Based)
- PyDabs (Python version of Databricks Asset Bundles)
- Databricks Terraform Provider
- Python SDK
- Rest API

The repo contains examples of automating your workflows using

([Databricks Asset Bundles](https://docs.databricks.com/en/dev-tools/bundles/index.html))

The job definition part under dab_resources folder has examples of deploying diferent Job types in databricks workflows.

        - Delta Live Table pipeline
        - DBT pipeline
        - Wheel file dependency from Unity Catalog Volumes
        - MLOPS Write feature table job
        - MLOPS Model training job
        - MLOPS Batch inference job
 

([Terraform](https://registry.terraform.io/providers/databricks/databricks/latest/docs))


The terraform code under terraform/modules/ has examples of deploying the above jobs using Terraform scripts. 

PyDabs (Private Preview)

The pydabs code under src/jobs are used to generate the corresponding YML file to be deployed as part of the asset bundle deployment.

## CI/CD integration 

The repo has examples of integrating with different CI/CD platforms 


Azure Devops

There are three pipelines defined for Azure Devops integration

   - Deploying a Databricks Asset bundles based workflows to databricks -  azure-pipelines-dab.yml
   - Deploying a Terraform based workflows to databricks -  azure-pipelines-tf.yml
   - Deploying a pipeline to run pytests -  azure-pipelines-testcase.yml


Github Actions

There are five pipelines defined for Github Actions integration

   - Deploying a Databricks Asset bundles based workflows to Databricks  CI -  .github/workflows/dabsDeploymentCI.yml
   - Deploying a Databricks Asset bundles based workflows to Databricks  CD -  .github/workflows/dabsDeploymentCD.yml
   - Deploying a Terraform based workflows to Databricks CI -   .github/workflows/TerraformDeploymentCI.yml
   - Deploying a Terraform based workflows to Databricks CD -   .github/workflows/TerraformDeploymentCD.yml
   - Running Unit test case using pytest -   .github/workflows/testCase.yml

   The workflow will be as shown below.


 
## Running test cases

The repo has examples of running pytests and integrating the same in a ci/cd workflow 

Test cases under src/tests are run againts a predefined cluster in a databricks workspace using Databricks Connect

Running pytes test cases using [Databricks Connect](https://docs.databricks.com/en/dev-tools/databricks-connect/index.html).


The pipeline is deployed using the below wokflows.


![Git hub Actions workflow](images/GithubActions.png)

![Git hub Actions CI](images/CI.png)
![Git hub Actions CD Test](images/CDtest.png)
![Git hub Actions CD Prod](images/CDprod.png)


[Local Environment set up ](localSetup.md)

[Azure Devops Deployment](Azuredevops.md)