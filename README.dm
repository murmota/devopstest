по скольку docker-compose up  не может спулить слой образа postgres (пробовал множество различных версий postgres),
GitActions задачу выполнить непредстовляется возможным ) скрины прикреплю.
потратил несколько часов на попытку фикса, ставил mirror в Docker registry + DNS
  "dns": ["8.8.8.8", "1.1.1.1"],
  "registry-mirrors": [
  "https://mirror.baidubce.com",
  "https://docker.mirrors.ustc.edu.cn",
  "https://hub-mirror.c.163.com",
  "https://registry.docker-cn.com",
  "https://mirror.gcr.io",
  "https://dockerproxy.com",
  "https://registry.npmmirror.com",
  "https://registry.docker-accelerate.aliyuncs.com",
  "https://mirror.swr.myhuaweicloud.com"
  ]

Сама задача заняла менее часа учитывая что я python даже не трогал ниразу и половину.



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

