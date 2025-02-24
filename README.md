# Flutter Login UI with GetX State Management

This Flutter project implements a login system with GetX for state management. It includes validation, API integration, and navigation across three screens.

## Features

- **Login Screen**
  - Email and password validation.
  - SHA256 encryption for password security.
  - API call for authentication.
  - Error handling with appropriate messages.
- **Home Screen**
  - Displays images and scrollable cards.
  - Minimum of five scrollable items.
  - Clicking an item navigates to the description screen.
- **Description Screen**
  - Displays at least three images.
  - Includes a share icon to open the default mobile share options.

## Tech Stack

- **Flutter** (Frontend UI)
- **GetX** (State Management)
- **Dio** (HTTP Requests)
- **SHA256 Encryption** (Password Security)

## Installation

1. Clone the repository:
   ```sh
   git clone <repo-url>
   ```
2. Navigate to the project directory:
   ```sh
   cd flutter_login_ui
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run
   ```

## API Integration

- Uses a `POST` request to authenticate users.
- Sends email and SHA256-encrypted password as `FormData`.
- Implements proper error handling for invalid credentials.

## Contribution

Feel free to fork and submit pull requests.

## License

This project is licensed under the MIT License.

