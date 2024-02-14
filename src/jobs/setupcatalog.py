from databricks.workflows import Bundle, Compute, ComputeSpec, job, notebook_task,RunIf,task


compute_spec = ComputeSpec(
  node_type_id  = Bundle.variables.node_type,
  spark_version = Bundle.variables.spark_version,
  num_workers   = 1
)


@job(
  name            = "WAT-Customer Order Details",
  default_compute = Compute(
                      compute_key = "wat_shared_cluster",
                      spec        = compute_spec
                    )
)

def run_setup_job(dbt_catalog: str = Bundle.variables.dbt_catalog,dbt_schema: str =Bundle.variables.dbt_schema
                     ,dlt_catalog: str =Bundle.variables.dlt_catalog,dlt_schema: str =Bundle.variables.dlt_schema
                     ,volume_schema: str =Bundle.variables.volume_schema,pii_volume_schema: str =Bundle.variables.pii_volume_schema):
  Set_up_UC_Catalog_and_Schema()






@notebook_task(notebook_path="databricks_notebooks/Initial_Setup.py")
def Set_up_UC_Catalog_and_Schema(dbt_catalog: str,dbt_schema: str, dlt_catalog: str, dlt_schema:str,volume_schema:str,pii_volume_schema: str):
  pass

