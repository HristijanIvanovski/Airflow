FROM apache/airflow:latest

ENV _AIRFLOW_WWW_USER_CREATE_USERNAME=admin
ENV _AIRFLOW_WWW_USER_CREATE_PASSWORD=admin
ENV _AIRFLOW_WWW_USER_CREATE_EMAIL=admin@example.com
ENV _AIRFLOW_WWW_USER_CREATE_FIRSTNAME=Airflow
ENV _AIRFLOW_WWW_USER_CREATE_LASTNAME=Admin

# Copy the DAG script to the DAGs folder in the container
COPY airflow_dag_task.py /opt/airflow/dags/

# Copy the Airflow configuration
COPY airflow.cfg /opt/airflow/airflow.cfg

# Adding entrypoint script and setting permissions
COPY entrypoint.sh /entrypoint.sh
USER root
RUN chmod +x /entrypoint.sh && chown airflow: /entrypoint.sh
USER airflow
ENTRYPOINT ["/entrypoint.sh"]
