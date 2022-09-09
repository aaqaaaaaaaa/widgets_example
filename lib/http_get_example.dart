import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpExample extends StatefulWidget {
  const HttpExample({Key? key}) : super(key: key);

  @override
  State<HttpExample> createState() => _HttpExampleState();
}

class _HttpExampleState extends State<HttpExample> {
  final String url = 'https://swapi.co/api/people';
  List data = [];

  @override
  void initState() {
    getData();
    defaultTargetPlatform == TargetPlatform.iOS;
    super.initState();
  }

  Future<String> getData() async {
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    var result = jsonDecode(response.body);
    data = result['results'];
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Example'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: data.isEmpty ? 0 : data.length,
          itemBuilder: (context, index) {
            return Card(
              child: Text(data[index]["name"]),
            );
          }),
    );
  }
}
