import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kColorPrimary,
      bottom: PreferredSize(preferredSize: Size(0, 16), child: SizedBox()),
      title:
          _isSearching
              ? TextField(
                controller: _searchController,
                autofocus: true,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'Search notes...',
                  hintStyle: TextStyle(color: kColorHint),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  // Update search results in real-time
                  BlocProvider.of<NotesCubit>(context).searchNotes(value);
                },
              )
              : Text(
                'Notes',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 43),
              ),
      centerTitle: false,
      floating: true,
      snap: true,
      actionsPadding: EdgeInsets.only(right: 20),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              if (_isSearching) {
                // Clear search and show all notes
                _searchController.clear();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              }
              _isSearching = !_isSearching;
            });
          },
          icon: Icon(_isSearching ? Icons.close : Icons.search, size: 24),
        ),
        SizedBox(width: 16),
        IconButton(onPressed: () {}, icon: Icon(Icons.info_outline, size: 24)),
      ],
    );
  }
}
