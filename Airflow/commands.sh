kubectl create clusterrolebinding service-reader-pod \
--clusterrole=airflow \
--serviceaccount=default:default

#this command should be executed from the folder where airflow.cfg file is kept.
kubectl create configmap airflow-configmap --from-file=./airflow.cfg

kubectl create secret docker-registry airflow-test \
--namespace default \
--docker-server=mlworks.azurecr.io \
--docker-username=mlworks \
--docker-password=FRBdoC9Xy7bMV7cTeCPGwQjTS+GMPSPv

