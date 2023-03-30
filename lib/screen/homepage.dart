import 'package:flutter/material.dart';
import 'package:my_app/model/model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<todo> todos = dataTodo;

  @override
  Widget build(BuildContext context) {
    AppBar myAppBar = AppBar(
      title: Text('Todo Apps'),
    );

    double heightBody = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    double widthBody = MediaQuery.of(context).size.width;

    void searchTodo(String query) {
      final todoFilter = dataTodo.where((todo) {
        final todoTitle = todo.judul.toLowerCase();
        final input = query.toLowerCase();
        return todoTitle.contains(input);
      }).toList();

      setState(() {
        todos = todoFilter;
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'addtodo');
        },
        child: Icon(Icons.add),
      ),
      appBar: myAppBar,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: widthBody,
            height: heightBody * 0.2,
            child: TextField(
              onChanged: searchTodo,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Your Todo',
              ),
            ),
          ),
          todos.length != 0
              ? Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        return CheckboxListTile(
                          title: Text(todo.judul,
                              style: TextStyle(
                                decoration: todo.is_selesai
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              )),
                          subtitle: Text(todo.desc),
                          secondary: IconButton(
                            onPressed: () {
                              setState(() {
                                todos.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: todo.is_selesai,
                          onChanged: (value) {
                            setState(() {
                              todo.is_selesai = value!;
                            });
                          },
                        );
                      },
                    ),
                  ),
                )
              : Container(
                  child: Text('Data Kosong'),
                ),
        ],
      ),
    );
  }
}
