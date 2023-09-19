// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trizzled_movies/constant.dart';
import 'package:trizzled_movies/utility/text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(20, (i) => "Movie ${i + 1}");
  List<String> items = [];

  @override
  void initState() {
    items = duplicateItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,

        // The search area here
        title: ModifiedText(
          text: appName,
          size: 25,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (value) {},
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: Alignment.center,
                    child: Text(items[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
