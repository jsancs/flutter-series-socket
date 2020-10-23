import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_series_app/models/serie.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Serie> series = [
    Serie(id: '1', name: 'Suits', votes: 3),
    Serie(id: '2', name: 'Friends', votes: 5),
    Serie(id: '3', name: 'GOT', votes: 1),
    Serie(id: '4', name: 'Breaking Bad', votes: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Series',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: series.length,
          itemBuilder: (context, index) => _serieTile(series[index])),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: Icon(Icons.add),
        elevation: 1,
      ),
    );
  }

  Widget _serieTile(Serie serie) {
    return Dismissible(
      key: Key(serie.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (DismissDirection direction) {
        print('direction $direction');
        print('id ${serie.id}');
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Delete serie',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(serie.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(serie.name),
        trailing: Text(
          '${serie.votes}',
          style: TextStyle(fontSize: 20.0),
        ),
        onTap: () {
          print(serie.name);
        },
      ),
    );
  }

  addNewBand() {
    final textController = new TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('New serie name:'),
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                  onPressed: () => addSerieToList(textController.text),
                  child: Text('Add'),
                  elevation: 5,
                  textColor: Colors.blue,
                )
              ],
            );
          });
    }

    showCupertinoDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
            title: Text('New serie name:'),
            content: CupertinoTextField(
              controller: textController,
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Add'),
                onPressed: () => addSerieToList(textController.text),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text('Dismiss'),
                onPressed: () => Navigator.pop(context),
              ),
            ]);
      },
    );
  }

  void addSerieToList(String name) {
    print(name);
    if (name.length > 1) {
      //Podemos agregar
      this
          .series
          .add(new Serie(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
