// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notes_app/cubits/notes/notes_cubit.dart';
// import 'package:notes_app/cubits/notes/notes_state.dart';

// class NotesScreen extends StatefulWidget {
// 	const NotesScreen({Key? key}) : super(key: key);
	
// 	@override
// 	_NotesScreenState createState() => _NotesScreenState();
// }
	
// class _NotesScreenState extends State<NotesScreen> {
// 	final screenCubit = NotesCubit();
	
// 	@override
// 	void initState() {
// 		screenCubit.loadInitialData();
// 		super.initState();
// 	}
	
// 	@override
// 	Widget build(BuildContext context) {
// 		return Scaffold(
// 			body: BlocConsumer<NotesCubit, NotesState>(
// 				bloc: screenCubit,
// 				listener: (BuildContext context, NotesState state) {
// 					if (state.error != null) {
// 						// TODO your code here
// 					}
// 				},
// 				builder: (BuildContext context, NotesState state) {
// 					if (state.isLoading) {
// 						return Center(child: CircularProgressIndicator());
// 					}
	
// 					return buildBody(state);
// 				},
// 			),
// 		);
// 	}
	
// 	Widget buildBody(NotesState state) {
// 		return ListView(
// 			children: [
// 				// TODO your code here
// 			],
// 		);
// 	}
// }
