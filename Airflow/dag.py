import airflow
from airflow import DAG
from CustomAirflowPackages.CustomKubernetesPodOperator import CustomKubernetesPodOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': airflow.utils.dates.days_ago(0),
}

dag = DAG('ExplainabilityDAG', default_args=default_args, schedule_interval=None)


ExplainabilityTask = CustomKubernetesPodOperator(
    namespace='default',
    image="mlworks.azurecr.io/exp:001",
    cmds=['python3', 'mlworks_xai_wrapper.py'],
    arguments=[],
    labels={},
    name="ExplainabilityDAG",
    task_id="ExplainabilityDAG",
    get_logs=True,
    dag=dag,
    log_events_on_failure=True,
    is_delete_operator_pod=True,
    resources={'request_cpu': 40},
    startup_timeout_seconds=600
    )


ExplainabilityTask
