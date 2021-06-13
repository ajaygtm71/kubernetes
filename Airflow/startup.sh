#set -x

#cd /usr/local/lib/python3.6/site-packages/airflow && \
#cp -R example_dags/* /root/airflow/dags/ && \
#export MLWORKS_PATH=/root/airflow/mlops-backend
#echo $MLWORKS_PATH
airflow initdb # && \
#alembic upgrade heads && \
#(airflow create_user --username airflow --lastname airflow --firstname jon --email airflow@apache.org --role Admin --password airflow || true)
#air

if [ "$1" = "webserver" ]
then
    exec airflow webserver
fi
<200b>
if [ "$1" = "scheduler" ]
then
    exec airflow scheduler
fi
#bash root/airflow/airflow-bootstrap-scripts/airflow_web.sh