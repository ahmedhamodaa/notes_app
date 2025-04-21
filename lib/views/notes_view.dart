import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size(0, 16),
              child: SizedBox(),
            ),
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
          ),

          // Body content
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
