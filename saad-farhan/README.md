# Positive+1 Flutter Developer Technology Test
# Project Setup Instructions:

1. Clone the Repository
2. Navigate to saad-farhan/backend
3. Create a .env file and paste the following content
SQLALCHEMY_DATABASE_URI=postgresql://postgres:postgres@ppdb:5432/ppdb
SQLALCHEMY_DATABASE_TEST_URI=postgresql://postgres:postgres@ppdb:5432/ppdb_test

4. Open terminal and run docker-compose up --build (Make sure to have docker installed). This will run tests and create dummy data
5. Open the Dockerfile
6. Comment line no 18 and uncomment line 19
7. Run docker-compose up --build
8. Open a different terminal and run ngrok http http://0.0.0.0:6061 to create a ngrok tunnel for flutter app
9.  Copy ngrok forwarding url
10. Open the flutter app under saad-farhan/positiveplusone in vs code
11. Go to the api_service.dart file and replace the baseURL with ngrok URL
12. Run the flutter app (Flutter Version : 3.16.3)

# Additional Steps to configure ngrok
1. brew install ngrok/ngrok/ngrok
2. ngrok config add-authtoken <your-auth-token-from-ngrok-dashboard>


# Tested the UI on Pixel_3

# Addtional Note
1. Some fonts weren't open source like BN Super-Sized so I used some other font for that