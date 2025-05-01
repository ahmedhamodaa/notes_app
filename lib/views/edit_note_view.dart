import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_dialog.dart';
import 'package:notes_app/widgets/note_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  String? title, content;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing note data
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            // ===== Top Row (Back + Save) =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  IconButton(
                    onPressed: () {
                      widget.note.title = title ?? widget.note.title;
                      widget.note.content = content ?? widget.note.content;
                      widget.note.save();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.save_as_outlined),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NoteTextField(
                      controller: titleController,
                      onChanged: (p0) {
                        title = p0;
                      },
                      fontSize: 48,
                      hintText: 'Title',
                      topPadding: 32,
                      horizontalPadding: 20,
                    ),
                    NoteTextField(
                      controller: contentController,
                      onChanged: (p0) {
                        content = p0;
                      },
                      hintText: 'Type something...',
                      fontSize: 23,
                      minLines: 14,
                      topPadding: 20,
                      horizontalPadding: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
