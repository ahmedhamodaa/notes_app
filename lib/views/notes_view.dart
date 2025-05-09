import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/note_item.dart';

void doNothing(BuildContext context) {}

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar
          CustomAppBar(),

          // Body content
          BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              List<NoteModel> notes =
                  BlocProvider.of<NotesCubit>(context).notes ?? [];
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  addAutomaticKeepAlives: true,
                  childCount: notes.length,
                  (context, index) => NoteItem(note: notes[index]),
                ),
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,
            backgroundColor: kColorPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            context: context,
            builder: (context) => AddNoteBottomSheet(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
