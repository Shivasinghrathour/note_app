# Flutter Note Application

This is a simple Flutter application for managing notes. Users can create an account using their email and password, log in to the application, add notes, and view their existing notes.

## Features

- User Authentication: Users can create an account using their email and password. Authentication is handled using Firebase Authentication.
- Add Notes: Logged-in users can add new notes with a title and description.
- View Notes: Users can view their existing notes after logging in.
- Edit and Delete Notes: Users can edit and delete their notes.

## Technologies Used

- Flutter: A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- Firebase: A platform developed by Google for creating mobile and web applications. In this application, Firebase Authentication and Cloud Firestore are used.
- GetX: A powerful Flutter package for state management, navigation, and dependency injection.

## Setup

1. Clone the repository to your local machine:

   ```bash
   
   git clone https://github.com/Shivasinghrathour/note_app.git

2. Navigate to the project directory:
   
   ```bash
   
   cd flutter- note_app

3. Install dependencies:
   ```bash
   
   flutter pub get

4. Set up Firebase for your project:
   
   Create a new Firebase project on the Firebase Console. Add an Android app to your Firebase project and follow the setup instructions to add the google-services.json file to your Flutter       project. Add an iOS app to your Firebase project and follow the setup instructions to add the GoogleService-Info.plist file to your Flutter project. Enable Firebase Authentication and         Cloud Firestore for your project.

6. Run the application:
    ```bash
   flutter run
## Directory Structure
   1. lib/: Contains the Dart source code for the application.
   2. controller/: Contains controllers for managing state and logic.
   3. model/: Contains data models used in the application.
   4. main.dart: Entry point of the application.
   5. android/: Contains native Android project files.
   6. pubspec.yaml: Flutter project configuration file.

## Contributing
Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue on GitHub or submit a pull request.
