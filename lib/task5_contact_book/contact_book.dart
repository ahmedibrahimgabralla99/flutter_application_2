import 'package:flutter/material.dart';

class ContactBook extends StatefulWidget {
  @override
  _ContactBookState createState() => _ContactBookState();
}

class _ContactBookState extends State<ContactBook> {
  List<Map<String, String>> contacts = [];

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  void addContact() {
    setState(() {
      contacts.add({"name": nameCtrl.text, "phone": phoneCtrl.text});
    });
    nameCtrl.clear();
    phoneCtrl.clear();
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Book")),
      body: Column(
        children: [
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(hintText: "Name"),
          ),
          TextField(
            controller: phoneCtrl,
            decoration: InputDecoration(hintText: "Phone"),
          ),
          ElevatedButton(onPressed: addContact, child: Text("Add")),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(contacts[i]['name']!),
                subtitle: Text(contacts[i]['phone']!),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteContact(i),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
