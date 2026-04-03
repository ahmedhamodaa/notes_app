# Notes App — Project Details

## Overview

**Notes App** is a cross-platform mobile application built with **Flutter** for creating, viewing, editing, searching, and deleting personal notes. All data is stored **locally on the device** using **Hive** (no remote API or backend).

---

## Features

- **Create notes** — Add a title and body from a modal bottom sheet; form validation ensures required fields.
- **List notes** — Scrollable list of notes on the home screen with a dark-themed **Material** UI and amber note cards.
- **Edit notes** — Open a note in a bottom sheet–style editor, update title and content, and persist changes to Hive.
- **Delete notes** — Swipe a note away (**Dismissible**) to remove it from storage and refresh the list.
- **Search** — Toggle search in the app bar; filter notes in real time by **title** or **content** (case-insensitive).
- **Loading feedback** — Saving a new note shows an overlay progress indicator (**ModalProgressHUD**) while the write completes.
- **Date display** — New notes get a human-readable date via **`intl`** (`DateFormat.yMMMMd()`).
- **Theming** — Custom dark palette (primary/secondary grays), **Nunito** font family, and tuned text selection colors.

---

## Technologies & Packages

| Area | Technology / Package |
|------|----------------------|
| Framework | **Flutter**, **Dart** (SDK ^3.7.2) |
| State management | **flutter_bloc** — **Cubit** pattern (`NotesCubit`, `AddNoteCubit`) |
| Local database | **hive**, **hive_flutter** — typed box `notes_box` for `NoteModel` |
| Code generation | **hive_generator**, **build_runner** — Hive type adapters (`NoteModel` + `.g.dart`) |
| UI / UX | **Material Design**, **Cupertino Icons**, custom **SliverAppBar**, bottom sheets |
| Gestures | **Dismissible** (swipe-to-delete); **flutter_slidable** is listed in dependencies |
| Loading overlay | **modal_progress_hud_nsn** |
| Formatting | **intl** — date formatting |
| Animations | **flutter_animate** (declared in `pubspec.yaml`) |
| Quality | **flutter_lints**, **flutter_test** |

---

## Architecture & Patterns

- **BlocProvider** at the app root supplies `NotesCubit` and loads notes on startup (`fetchAllNotes`).
- **NotesCubit** — Holds the in-memory note list, mirrors the Hive box, and implements **search** against cached `_allNotes`.
- **AddNoteCubit** — Handles async `addNote`; emits loading, success, and error states consumed by **BlocConsumer** in the add-note flow.
- **SimpleBlocObserver** — Global `BlocObserver` for debug logging of cubit lifecycle and state changes.
- **Separation** — Models (`NoteModel`), cubits, views, and reusable widgets live under `lib/`.

---

## Data Model

**`NoteModel`** (Hive object):

- `title` — `String`
- `content` — `String`
- `date` — `String` (formatted display date)
- Hive **typeId: 0**; fields indexed with `@HiveField`; `id` exposed via Hive `key`.

Persistence: `Hive.initFlutter()` in `main`, adapter registration, `openBox<NoteModel>(kNotesBox)`.

---

## UI Structure (High Level)

- **`main.dart`** — Hive + Bloc setup, `MaterialApp`, theme, home `NotesView`.
- **`NotesView`** — `CustomScrollView` with `CustomAppBar` and `BlocBuilder` over the note list; FAB opens **AddNoteBottomSheet**.
- **`CustomAppBar`** — Floating **SliverAppBar** with title / search field toggle and search integration with `NotesCubit`.
- **`NoteItem`** — Tappable card opening **EditNoteView** in a modal route; swipe deletes.
- **`AddNoteForm` / `EditNoteView`** — Forms with **NoteTextField**, save/back actions, **CustomDialog** where used.

**Fonts:** Nunito (Regular, Medium, SemiBold, Bold, variable) under `assets/fonts/`.

**Colors (constants):** Primary `#1C1C1C`, secondary `#3B3B3B`, hints and on-primary defined in `constants.dart`.

---

## Platforms

Standard Flutter targets: **Android**, **iOS** (project includes `android/` and `ios/` configuration).

---

## Repository & Portfolio

- **GitHub:** [https://github.com/ahmedhamodaa/notes_app](https://github.com/ahmedhamodaa/notes_app)
- **Preview / demo link:** Not set in portfolio metadata (`project_info.dart`).

---

## Version

Application version in `pubspec.yaml`: **1.0.0+1**.
