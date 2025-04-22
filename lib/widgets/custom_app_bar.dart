import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kColorPrimary,
      bottom: PreferredSize(preferredSize: Size(0, 16), child: SizedBox()),
      title: Text(
        'Notes',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 43,
          color: Colors.white,
        ),
      ),
      centerTitle: false,
      floating: true,
      snap: true,
      actionsPadding: EdgeInsets.symmetric(horizontal: 16),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, size: 24),
          color: Colors.white,
        ),
        SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.info_outline, size: 24),
          color: Colors.white,
        ),
      ],
    );
  }
}
