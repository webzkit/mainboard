# zkit Gate

### Development

Uses the default FastApi development server.

1. cp env-sample to .env
2. Build the images and run the containers:

    ```sh
    docker-compose up -d --build zkit
    ```

    Test it out at The "application" folder is mounted into the container and your code changes apply automatically.

    ##### Tool

    The PgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL

    ```
    link: http://localhost:5050
    username: pgadmin4@pgadmin.org
    password: admin
    ```

3. init db

```
docker exec -it zkit bash
alembic revision --autogenerate -m "this is message"
alembic upgrade head
```
