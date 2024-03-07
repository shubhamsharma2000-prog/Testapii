// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapi/model.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Testapi> testapi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Test Api"),
      ),
      body: ListView.builder(
        itemCount: testapi.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            color: Colors.greenAccent,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "user id : ${testapi[index].userId}",
                  style: TextStyle(fontSize: 14),
                ),
                if (testapi.isNotEmpty)
                  Text(
                    ' Id : ${testapi[index].id}',
                    style: TextStyle(fontSize: 14),
                  ),
                Text(
                  "Title : ${testapi[index].title}",
                  maxLines: 1,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "Body : ${testapi[index].body}",
                  maxLines: 1,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        testapi.add(Testapi.fromJson(index));
      }
      setState(() {}); // Notify the framework that the widget tree has changed
    } else {
      // Handle error
    }
  }
}
