# TODO-LIST-Flutter

A simple and modern TODO list app built with Flutter.  
This project demonstrates best practices for state management, local database, internationalization, and UI design.

## Features

- **Task Management**
  - Add, edit, and delete tasks
  - Set deadlines for tasks (date picker only)
  - Attach images to tasks
  - Task status: Not Started, In Progress, Completed, Overdue

- **User Management**
  - Sign up and sign in
  - Local user profile (name, email)

- **Task Details**
  - View task details, including description, deadline, status, and attachment
  - Image preview with auto size

- **Internationalization**
  - Supports English and Simplified Chinese
  - Switch language in settings

- **Settings**
  - View user info
  - Change language
  - Log out

- **UI/UX**
  - Responsive layouts
  - Empty state view for task list
  - SafeArea and adaptive widgets

- **Local Database**
  - Uses [sqflite](https://pub.dev/packages/sqflite) for persistent storage

## Getting Started

1. Install [Flutter](https://flutter.dev/docs/get-started/install)
2. Clone this repo
3. Run `flutter pub get`
4. Run `flutter run`
