# Positive+1 Flutter Developer Technology Test
# Project Setup Instructions:

1. Clone the Repository
2. Navigate to saad-farhan/backend
3. Open terminal and run docker-compose up --build (Make sure to have docker installed). This will run tests and create dummy data
4. Open the Dockerfile
5. Comment line no 18 and uncomment line 19
6. Run docker-compose up --build
7. Open a different terminal and run ngrok http http://0.0.0.0:6061 to create a ngrok tunnel for flutter app
8.  Copy ngrok forwarding url
9. Open the flutter app under saad-farhan/positiveplusone in vs code
10. Go to the api_service.dart file and replace the baseURL with ngrok URL
11. Run the flutter app (Flutter Version : 3.16.3)

# Additional Steps to configure ngrok
1. brew install ngrok/ngrok/ngrok
2. ngrok config add-authtoken <your-auth-token-from-ngrok-dashboard>


# Tested the UI on Pixel_3