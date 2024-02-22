import random
from fastapi.testclient import TestClient

from .main import app

client = TestClient(app)


def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello World"}
    
def test_create_user_main():
    data = {
        "first_name" : "Saad",
        "last_name" : "Farhan",
        "user_name" : "saadfarhan124",
        "email" : "saadfarhan124@gmail.com",
        "photo_url": "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg"
    }
    # Check user got created
    response = client.post("/api/v1/user", json =data)
    assert response.status_code == 200
    
    # Check creating a user with new data
    data = {
        "first_name" : "Saad",
        "last_name" : "Farhan",
        "user_name" : "saadfarhan875",
        "email" : "saadfarhan875@gmail.com",
        "photo_url": "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg"
    }
    response = client.post("/api/v1/user", json =data)
    assert response.status_code == 200
    
    # Check creating user with same username and email returns an error
    response = client.post("/api/v1/user", json =data)
    assert response.status_code == 500
    
     # Check creating user with malformed data
    data["email"] = None
    response = client.post("/api/v1/user", json =data)
    assert response.status_code == 422
    
def test_create_posts():
    data = {
        "user_id" : 1,
        "caption" : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut faucibus quam. <link>Vestibulum ante ipsum</link> primis in @faucibusorciluctus et name.",   
        "tags" : [
            { "content" : "Tag"},
            { "content" : "Anothertag"},
            { "content" : "3rdtag"},
            { "content" : "AFourthTag"},
            { "content" : "Alongtagthatwraps"},
        ],
        "image_uri" : "https://static.cdprojektred.com/cms.cdprojektred.com/16x9_big/872822c5e50dc71f345416098d29fc3ae5cd26c1-1280x720.jpg"
    }
    # Check post got created
    response = client.post("/api/v1/post", json =data)
    assert response.status_code == 200
    data["caption"] = None
    
    # Check post doesn't get created with malformed data
    response = client.post("/api/v1/post", json =data)
    assert response.status_code == 422
    
    data["caption"] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut faucibus quam. <link>Vestibulum ante ipsum</link> primis in @faucibusorciluctus et name."
    data["image_uri"] = None
    # Create test posts
    for i in range(0, 10):
        if i == 9:
            data["image_uri"] = "https://static.cdprojektred.com/cms.cdprojektred.com/16x9_big/872822c5e50dc71f345416098d29fc3ae5cd26c1-1280x720.jpg"
        response = client.post("/api/v1/post", json =data)
        assert response.status_code == 200
        
        
def test_create_comments():
    data = {
        "post_id" : 11,
        "user_id" : 2
    }
    # Check if comment get created with malformed data
    response = client.post("/api/v1/post/comment", json =data)
    assert response.status_code == 422
    
    # Check comment got created
    data["content"] = "This is my first comment"
    response = client.post("/api/v1/post/comment", json =data)
    assert response.status_code == 200
    
    # Create test comments
    for _ in range(0, 30):
        data["post_id"] = random.randint(1, 11)
        response = client.post("/api/v1/post/comment", json =data)
        assert response.status_code == 200