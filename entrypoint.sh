#!/bin/bash

airflow db init

airflow users create \
    --username admin \
    --password admin \
    --firstname Airflow \
    --lastname Admin \
    --role Admin \
    --email admin@example.com

exec airflow webserver & airflow scheduler
