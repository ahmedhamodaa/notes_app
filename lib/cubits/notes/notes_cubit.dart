import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  List<NoteModel>? _allNotes; // Store all notes for search filtering

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    _allNotes = notesBox.values.toList();
    notes = _allNotes;
    emit(NotesSuccess());
  }

  searchNotes(String query) {
    if (query.isEmpty) {
      // If search query is empty, show all notes
      notes = _allNotes;
    } else {
      // Filter notes based on search query
      notes =
          _allNotes?.where((note) {
            final titleMatch = note.title.toLowerCase().contains(
              query.toLowerCase(),
            );
            final contentMatch = note.content.toLowerCase().contains(
              query.toLowerCase(),
            );
            return titleMatch || contentMatch;
          }).toList();
    }
    emit(NotesSuccess());
  }
}
