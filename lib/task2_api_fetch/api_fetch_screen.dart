import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiFetchScreen extends StatefulWidget {
  @override
  _ApiFetchScreenState createState() => _ApiFetchScreenState();
}

class _ApiFetchScreenState extends State<ApiFetchScreen> {
  String joke = "Press button to load joke";

  Future<void> fetchJoke() async {
    final response = await http.get(
      Uri.parse("https://official-joke-api.appspot.com/random_joke"),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        joke = "${data['setup']} \n\n${data['punchline']}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Fetch Task")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(joke, textAlign: TextAlign.center),
              SizedBox(height: 20),
              ElevatedButton(onPressed: fetchJoke, child: Text("Get Joke")),
            ],
          ),
        ),
      ),
    );
  }
}
