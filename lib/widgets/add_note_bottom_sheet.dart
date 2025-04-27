import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/widgets/custom_dialog.dart';
import 'package:notes_app/widgets/note_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(),
                    );
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () {
                    // Save note
                  },
                  icon: const Icon(Icons.save_outlined),
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
                    fontSize: 48,
                    hintText: 'Title',
                    topPadding: 32,
                    horizontalPadding: 20,
                  ),
                  NoteTextField(
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
    );
  }
}
