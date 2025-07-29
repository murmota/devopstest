from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from app import models, schemas, database
import logging
import os

app = FastAPI()

os.makedirs("logs", exist_ok=True)
logging.basicConfig(
    filename="logs/app.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

models.Base.metadata.create_all(bind=database.engine)

@app.get("/posts", response_model=list[schemas.Post])
def get_posts(db: Session = Depends(database.get_db)):
    posts = db.query(models.Post).all()
    logging.info(f"GET /posts — returned {len(posts)} posts")
    return posts

@app.post("/posts", response_model=schemas.Post)
def create_post(post: schemas.PostCreate, db: Session = Depends(database.get_db)):
    try:
        db_post = models.Post(title=post.title, content=post.content)
        db.add(db_post)
        db.commit()
        db.refresh(db_post)
        logging.info(f"Post created: {db_post.title}")
        return db_post
    except Exception as e:
        logging.error(f"Failed to create post: {e}")
        raise