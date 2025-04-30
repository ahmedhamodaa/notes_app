import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_dialog.dart';
import 'package:notes_app/widgets/note_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
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
                      if (formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(),
                        );
                      } else {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  IconButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var noteModel = NoteModel(
                          title: title!,
                          content: content!,
                          date: DateTime.now().toString(),
                        );
                        BlocProvider.of<AddNoteCubit>(
                          context,
                        ).addNote(noteModel);
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                      }
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
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please enter a title";
                        }
                      },
                      onSaved: (p0) {
                        title = p0;
                      },
                      fontSize: 48,
                      hintText: 'Title',
                      topPadding: 32,
                      horizontalPadding: 20,
                    ),
                    NoteTextField(
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please type something here";
                        }
                      },
                      onSaved: (p0) {
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
