// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:loginscreen/Share/Comp.dart';

class Mylist extends StatefulWidget {
  final String title;

  const Mylist({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  List createState() => List();
}

class List extends State<Mylist> {
  final GlobalKey<AnimatedListState> key = GlobalKey();
  final _items = [];
  int nextitem = 0;

  void _addItem() {
    _items.insert(0, "Item $nextitem");
    nextitem++;
    key.currentState!
        .insertItem(0, duration: const Duration(milliseconds: 700));
  }

  void _removeItem(int index) {
    key.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          elevation: 10,
          color: Color.fromARGB(255, 138, 9, 0),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Text("Deleting",
                style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
        ),
      );
    }, duration: const Duration(milliseconds: 700));

    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Map'),
        centerTitle: true,
      ),
      body: AnimatedList(
        key: key,
        initialItemCount: 0,
        padding: const EdgeInsets.all(8),
        itemBuilder: (_, index, animation) {
          return SizeTransition(
            key: UniqueKey(),
            sizeFactor: animation,
            child: Card(
              margin: const EdgeInsets.all(8),
              elevation: 5,
              color: mycolor,
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text(
                  _items[index],
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onPressed: () => _removeItem(index),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _addItem, child: const Icon(Icons.add)),
    );
  }
}
