# Top Movies App

This project is an iOS application that fetches and displays a list of top movies using the Movie Database (TMDb) API.

## Setup

### Prerequisites

- A TMDb API key. You can get it by creating an account on [TMDb](https://www.themoviedb.org/) and requesting an API key.

### Configuration

To configure the API key:

1. **Open the `config.plist` File:**

   - Locate the `Config.plist` file in your project directory. This file is already included in the project.

2. **Add Your API Key:**

   Open `Config.plist` and add your TMDb API key for the `API_KEY` dictionary.

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
       <key>API_KEY</key>
       <string>Your_API_Key_Here</string>
   </dict>
   </plist>

### Potential Improvements

1.	**Unit Tests:**
    -	The architecture is ready to support unit tests. Implementing unit tests will help ensure the reliability and robustness of the application.
2.	**Loading Indicator:**
    -	Add a loading indicator to inform users that the movies are being loaded. This will enhance user experience by providing visual feedback during data fetching.
3.	**Empty State View:**
    -	Implement a specific view to be displayed when the movie list is empty. This will improve the user experience by clearly indicating that there are no movies to display.
4.	**Persist Data:**
    -	Add functionality to persist data such as the watched state of movies.

### App Preview

Movie List | Movie Detail |
--- | ---
![Simulator Screenshot - iPhone 15 Pro - 2024-07-30 at 10 00 12](https://github.com/user-attachments/assets/6a649d6e-7f24-44d2-b8b6-e1a07870c78e) |  ![Simulator Screenshot - iPhone 15 Pro - 2024-07-30 at 10 00 19](https://github.com/user-attachments/assets/104c8291-1dc0-4d8d-aeb0-489090124b82)



