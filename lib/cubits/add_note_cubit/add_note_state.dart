class AddNoteState {
  final bool isLoading;
  final String? error;
  final bool wasSubmitted; // Track if a note was submitted

  const AddNoteState({
    this.isLoading = false,
    this.error,
    this.wasSubmitted = false,
  });

  AddNoteState copyWith({bool? isLoading, String? error, bool? wasSubmitted}) {
    return AddNoteState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      wasSubmitted: wasSubmitted ?? this.wasSubmitted,
    );
  }
}
