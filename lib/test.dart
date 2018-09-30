import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'package:flutter_slidable/flutter_slidable.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<String> list = List();

  @override
  Widget build(BuildContext context) {
    print('===========');
    return Scaffold(
      appBar: AppBar(
        title: Text('dsadas'),
        actions: <Widget>[
          IconButton(icon: Text('添加'), onPressed: (){
            addList();
          })
        ],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return slidableW(index);
        },
      ),
    );
  }

  addList() {
    setState(() {
      list.add('test${list.length}');
    });
  }

  Widget slidableW(int index) {
    return Slidable(
      delegate: SlidableDrawerDelegate(),
      actionExtentRatio: 0.20,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Text('$index'),
            foregroundColor: Colors.white,
          ),
          title: Text(list[index]),
          subtitle: Text('SlidableDrawerDelegate'),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            print('dsadasdsad');
            print(index);
            setState(() {
              list.removeAt(index);
            });
          },
        ),
      ],
    );
  }
}
