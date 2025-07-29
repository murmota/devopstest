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

