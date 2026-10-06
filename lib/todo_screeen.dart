import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final titleCOntroller = TextEditingController();
  final subTitleCOntroller = TextEditingController();
  List list = ["boy", "girl"];
  //print to do
  void showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Please enter you Todo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: titleCOntroller),
              TextField(controller: subTitleCOntroller),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                list.add(titleCOntroller.text);
                setState(() {});
                Navigator.pop(context);
              },
              child: Text("Add Todo"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Manage Lists",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 20),
          Icon(Icons.more_vert, color: Colors.grey),
          SizedBox(width: 20),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                list[index],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text('im am a boy'),

              trailing: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white),

        onPressed: () {
          showMyDialog(context);
        },
      ),
    );
  }
}
