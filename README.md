# Notes App

A Flutter notes application for creating, editing, searching, and deleting notes. Data is stored locally on the device with **Hive**—no account or network required.

## Features

- Create notes with title, content, and formatted date
- Edit and save existing notes
- Swipe to delete a note
- Search notes by title or content from the app bar
- Dark theme with custom **Nunito** typography
- Loading indicator while saving new notes

## Tech Stack

- [Flutter](https://flutter.dev/) & Dart
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit) for state management
- [Hive](https://pub.dev/packages/hive) for local persistence
- [intl](https://pub.dev/packages/intl) for date formatting
- [modal_progress_hud_nsn](https://pub.dev/packages/modal_progress_hud_nsn) for async UI feedback

## Requirements

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (compatible with Dart SDK `^3.7.2`)
- Xcode (for iOS) or Android Studio / SDK (for Android)

## Getting Started

Clone the repository and install dependencies:

```bash
git clone https://github.com/ahmedhamodaa/notes_app.git
cd notes_app
flutter pub get
```

If you change the Hive model (`lib/models/note_model.dart`), regenerate adapters:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Run the app:

```bash
flutter run
```

## Project Structure

```
lib/
├── constants.dart          # Colors and Hive box name
├── main.dart               # App entry, Hive init, Bloc setup
├── theme.dart              # ThemeData
├── models/                 # NoteModel + generated adapter
├── cubits/                 # NotesCubit, AddNoteCubit, states
├── views/                  # NotesView, EditNoteView
└── widgets/                # Reusable UI components
```

More detail: see [projectDetails.md](projectDetails.md).

## License

This project is private / not published to pub.dev (`publish_to: 'none'` in `pubspec.yaml`). Add a license file if you intend to open-source the repo.
