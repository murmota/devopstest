много времени ушло на попытку запустить приложение локально, потому что postgres не пулился при docker-compose up , mirrors не помогли.

init-postgres.sh скрипт создаёт дирректории для логов разбитые на app logs и внутри по дням.
requirements.txt содержит список нужных библиотек и т.д. которые добавляются в образ с помощью Dockerfile
В docker-compose.yml присутствует треуемый по тз volume для postgres.
## запуск локально

```bash
docker-compose up --build

http://localhost:8080/posts

POST /posts

{
  "title": "Title",
  "content": "text"
}

{
  "id": 1,
  "title": "Title",
  "content": "text"
}

GET /posts

[
  {
    "id": 1,
    "title": "Title",
    "content": "text"
  }
]

Python 3.11

FastAPI

SQLAlchemy

PostgreSQL

Docker, docker-compose

