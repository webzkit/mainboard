FROM apache/airflow:3.0.3rc4-python3.11

# Install additional Python packages
RUN pip install --no-cache-dir \
    pandas \
    scikit-learn \
    apache-airflow-providers-postgres

# Copy your DAGs into the container
COPY dags/ /opt/airflow/dags/

# You can also add custom entrypoint scripts or configuration files here
# COPY entrypoint.sh /opt/airflow/entrypoint.sh
# RUN chmod +x /opt/airflow/entrypoint.sh
# ENTRYPOINT ["/opt/airflow/entrypoint.sh"]
