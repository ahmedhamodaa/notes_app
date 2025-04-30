import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes/notes_state.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(const NotesState());

  fetchAllNotes(NoteModel note) async {
    // emit(state.copyWith(isLoading: true, error: null));

    try {
      final notesBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = notesBox.values.toList();
      emit(state.copyWith(isLoading: false, successfully: true, notes: notes));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
