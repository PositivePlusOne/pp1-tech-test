# Overview

This project is for test purpose only. The app is built using Flutter which displays list of posts uploaded by the users.

# API Setup and Run Instructions:

1. Clone the Repository:
Clone the API repository from GitHub
2. Navigate to the API Directory:
Open the terminal and change directory to the API folder
3. Run the API Server:
Ensure you have Python and Django installed.
Open the project in VS Code or your preferred code editor.
Run the following command to start the server:

Copy code
python manage.py runserver

# Flutter App Setup and Run Instructions:

1. Clone the Repository:
Clone the Flutter app repository from GitHub
2. Navigate to the Flutter App Directory:
Open the terminal and change directory to the Flutter app folder: cd positiveplus_flutterapp
3. Get Dependencies:
Ensure you have Flutter SDK installed (version 3.16.9).
4. Add .env file and add these two variables along with the base URL of API server:

GET_POSTS=$BASE_URL/posts/?format=json
GET_TAGS=$BASE_URL/hashtags/?format=json

APIs are hosted here: https://p1plus.gitwork.tech/

Ensure you have Flutter SDK installed (version 3.16.9).
Run the following command to get dependencies:

Copy code
flutter pub get

4. Run the App:
Open the project in VS Code or your preferred code editor.
Make sure an Android emulator or iOS simulator is running.
Run the following command to launch the app:

Copy code
flutter run

# Technical Choices Explanation:

API:
Language and Framework: Python with Django.
Dependencies: No additional dependencies needed.
Database: No specific requirements.
Setup: Simply open the project in VS Code and run the command python manage.py runserver to start the API server.

Flutter App:
IDE: VS Code.
Flutter SDK: Version 3.16.9.
Dependencies: Install dependencies using flutter pub get.
Device Requirements: App can run on Pixel 4a or iPhone Pro 15 Max.
Setup: Clone the project, install dependencies, and run the app using flutter run.

This README.md file provides clear instructions on setting up and running both your API and Flutter app, along with explanations of your technical choices. Let me know if you need any further assistance!
