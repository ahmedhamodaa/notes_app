import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(const AddNoteState());

  Future<void> addNote(NoteModel note) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(state.copyWith(isLoading: false, wasSubmitted: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
