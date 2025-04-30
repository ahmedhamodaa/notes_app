import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  void deleteNote(BuildContext context) {
    note.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Slidable(
        key: const ValueKey(0),

        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () => note.delete()),

          children: [
            SlidableAction(
              onPressed: deleteNote,
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete_rounded,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(12),
              ),
            ),
          ],
        ),

        endActionPane: const ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: doNothing,
              backgroundColor: Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.share,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
              // label: 'Share',
            ),
          ],
        ),

        child: GestureDetector(
          onTap:
              () => Navigator.push(
                context,
                ModalBottomSheetRoute(
                  backgroundColor: kColorPrimary,
                  showDragHandle: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => EditNoteView(),
                  isScrollControlled: true,
                ),
              ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 28),
            margin: EdgeInsets.symmetric(horizontal: 20),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.amber,
            ),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  note.content,
                  style: TextStyle(
                    color: Colors.black87,

                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      note.date,
                      style: TextStyle(
                        color: Colors.black,

                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
