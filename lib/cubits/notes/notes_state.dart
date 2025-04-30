import 'package:notes_app/models/note_model.dart';

class NotesState {
  final bool isLoading;
  final String? error;
  final bool successfully; // Track if a note was submitted
  final List<NoteModel> notes;

  const NotesState({
    this.isLoading = false,
    this.error,
    this.successfully = false,
    this.notes = const [],
  });

  NotesState copyWith({
    bool? isLoading,
    String? error,
    bool? successfully,
    List<NoteModel>? notes,
  }) {
    return NotesState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      successfully: successfully ?? this.successfully,
      notes: notes ?? this.notes,
    );
  }
}
