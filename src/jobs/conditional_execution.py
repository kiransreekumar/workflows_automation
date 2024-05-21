from databricks.bundles.jobs import task, job
from databricks.bundles.variables import Bundle


@job(name="Detect Anomalies",
     default_job_cluster_spec={
    "node_type_id": Bundle.variables.node_type,
    "spark_version": Bundle.variables.spark_version,
    "num_workers": 1,
  })

def detect_anomalies():
    anomaly_count = get_anomaly_count()

    if anomaly_count.output > 0:
        send_report()


@task
def get_anomaly_count() -> int:
    return 42


@task
def send_report():
    print("Sending report")
