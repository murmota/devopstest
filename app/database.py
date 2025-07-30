from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import logging
import os
import datetime

today = datetime.date.today().isoformat()
log_dir = f"logs/applogs/{today}"
os.makedirs(log_dir, exist_ok=True)

logging.basicConfig(
    filename=f"{log_dir}/app.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

DATABASE_URL = os.environ.get("DATABASE_URL", "postgresql://postgres:postgres@localhost:5432/postgres")

logging.info("Initializing database connection")

engine = create_engine(DATABASE_URL)
Session = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

def get_db():
    db = Session()
    try:
        yield db
    finally:
        db.close()