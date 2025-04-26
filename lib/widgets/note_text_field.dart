import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    super.key,
    this.minLines = 1,
    required this.fontSize,
    required this.hintText,
    this.topPadding = 8,
  });

  final int minLines;
  final double fontSize;
  final String hintText;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return TextField(
      selectionControls: MaterialTextSelectionControls(),
      minLines: minLines,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: topPadding),
        hintText: hintText,
        hintStyle: TextStyle(color: kColorHint),
        border: InputBorder.none,
      ),
    );
  }
}
