много времени ушло на попытку запустить приложение локально,
потому что postgres не пулился при docker-compose up , mirrors не помогли.

так что по итогу локально проект не запускается, покрайней мере у меня, и сохранять логи
в ./logs/pglogs рядом с ./logs/applogs у меня не вышло.

requirements.txt содержит список нужных библиотек и т.д. которые добавляются в образ с помощью Dockerfile
В docker-compose.yml присутствует треуемый по тз volume для postgres.

+ скрины в ./pics

## запуск локально

git clone https://github.com/murmota/devopstest.git
cd devopstest
docker-compose up --build
```
http://localhost:8080/posts
```
Smoke test:
```
curl -X POST http://localhost:8080/posts \
  -H "Content-Type: application/json" \
  -d '{"title":"Test title","content":"Test content"}'
```
```
curl http://localhost:8080/posts
```

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


GitHub Actions:

Автоматический деплой на сервер происходит при пуше в ветку `main`
Если репозиторий ещё не клонирован, то он клонируется
Выполняется git pull => docker-compose down => docker-compose up --build -d

Secrets:

SERVER_HOST
SERVER_USER
SSH_PRIVATE_KEY


Python 3.11

FastAPI

SQLAlchemy

PostgreSQL 17

Docker, docker-compose

GitHub Actions

