part of 'notes_cubit.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {}

class NotesLoading extends NotesState {}

class NotesSearchResult extends NotesState {
  final List<NoteModel> searchResults;

  NotesSearchResult(this.searchResults);
}
