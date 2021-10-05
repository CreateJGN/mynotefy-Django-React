// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:app/models/auth.dart';
import 'package:app/components/drawer.dart';
import 'package:app/components/note_tile.dart';
import 'package:app/constants.dart';
import 'package:app/models/note.dart';
import 'package:app/models/notes.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  static const String id = 'dashboard';

  @override
  Widget build(BuildContext context) {
    final notesList = Notes().notesList;
    return Scaffold(
        backgroundColor: kbgcolor,
        drawer: DashboardDrawer(),
        appBar: AppBar(
          backgroundColor: kyellow,
          iconTheme: IconThemeData(color: kbgcolor),
          title: Text(
            'Notefy',
            style: TextStyle(
              color: kbgcolor,
              fontFamily: 'Roboto',
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                print(Provider.of<Auth>(context, listen: false).getKey());
                print('hello');
              },
              icon: Icon(
                Icons.search,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kyellow,
          onPressed: () {
            Navigator.pushNamed(
              context,
              RouteNames.noterscreen,
              arguments: Note(
                body: '',
                title: '',
                id: '',
                createTime: '',
                updateTime: '',
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: kbgcolor,
            size: 30,
          ),
        ),
        body: ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (context, index) {
            return NoteTile(
              note: notesList[index],
            );
          },
        ));
  }
}
