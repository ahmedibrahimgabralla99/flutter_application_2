import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  List<String> posts = [];
  TextEditingController controller = TextEditingController();

  void loadPosts() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      posts = prefs.getStringList('posts') ?? [];
    });
  }

  void addPost() async {
    final prefs = await SharedPreferences.getInstance();
    posts.add(controller.text);
    await prefs.setStringList('posts', posts);
    controller.clear();
    setState(() {});
  }

  void deletePost(int index) async {
    final prefs = await SharedPreferences.getInstance();
    posts.removeAt(index);
    await prefs.setStringList('posts', posts);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blog App")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Write post"),
          ),
          ElevatedButton(onPressed: addPost, child: Text("Add Post")),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(posts[i]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deletePost(i),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
