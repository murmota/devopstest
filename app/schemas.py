from pydantic import BaseModel

class PostCreate(BaseModel):
    title: str
    content: str

class Post(PostCreate):
    id: int

    class Config:
        orm_mode = True