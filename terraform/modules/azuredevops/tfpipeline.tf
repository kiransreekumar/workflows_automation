

resource "azuredevops_git_repository" "tfpipeline" {
  project_id            = azuredevops_project.project.id
  name       = "workflowsAutomationTF"
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/kiranskmr/dbt_wf"
  }

}

resource "azuredevops_build_definition" "tfpipelinebuild" {
  project_id = azuredevops_project.project.id
  name       = "Terraform Build Pipeline"

  ci_trigger {
    use_yaml = true
  }
  repository {
    repo_type             = "TfsGit"
    repo_id               = azuredevops_git_repository.tfpipeline.id 
    branch_name           = "main"
    yml_path              = "azure-pipelines-tf.yml"
  }
 variable_groups = [azuredevops_variable_group.variable_group.id]

  schedules {
    branch_filter {
      include = ["main"]
      exclude = ["test", "regression"]
    }
    days_to_build              = ["Wed", "Sun"]
    schedule_only_with_changes = true
    start_hours                = 10
    start_minutes              = 59
    time_zone                  = "(UTC) Coordinated Universal Time"
  }
}