import warnings
from datetime import datetime
from airflow import DAG
from airflow.operators.python_operator import PythonOperator

warnings.filterwarnings("ignore", category=DeprecationWarning)


def print_time_only(**kwargs):
    now = datetime.now()
    formatted_time = now.strftime('%Y.%m.%d %H:%M:%S')
    print(f'Current Time: {formatted_time}')


default_args = {
    'owner': 'airflow',
    'start_date': datetime(2022, 1, 1)
}

dag = DAG(
    dag_id='my_simple_dag',
    default_args=default_args,
    schedule_interval='*/1 * * * *',  # Run every minute
)

task = PythonOperator(
    task_id='print_time_only',
    python_callable=print_time_only,
    provide_context=True,
    dag=dag,
)
