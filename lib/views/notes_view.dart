import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

void doNothing(BuildContext context) {}

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar
          CustomAppBar(),

          // Body content
          SliverList(
            delegate: SliverChildBuilderDelegate(
              addAutomaticKeepAlives: true,
              childCount: 10,

              (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Slidable(
                  key: const ValueKey(0),

                  startActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),

                    children: const [
                      SlidableAction(
                        onPressed: doNothing,
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete_rounded,
                        borderRadius: BorderRadius.horizontal(
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
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(12),
                        ),
                        // label: 'Share',
                      ),
                    ],
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
                          'This is title',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Book Review : The Design of Everyday Things by Don Norman',
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
                              '23 Apr, 2025',
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
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
