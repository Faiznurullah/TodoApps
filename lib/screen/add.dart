import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/main.dart';
import 'package:my_app/model/model.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerJudul = TextEditingController();
    TextEditingController controllerDeskripsi = TextEditingController();
    AppBar myAppBar = AppBar(
      title: Text('Tambah Tugas'),
    );

    double heightBody = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    double widthBody = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controllerJudul.text.length != 0 ||
              controllerDeskripsi.text.length != 0) {
            todo newTodo = todo(
              id: DateTime.now().toString(),
              judul: controllerJudul.text.isNotEmpty
                  ? controllerJudul.text
                  : "No Title",
              desc: controllerDeskripsi.text.isNotEmpty
                  ? controllerDeskripsi.text
                  : "No Deskripsi",
              is_selesai: false,
            );
            dataTodo.add(newTodo);
          }
          Navigator.pop(context);
        },
        child: Icon(Icons.add_task),
      ),
      appBar: myAppBar,
      body: Container(
        width: widthBody,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white24,
              ),
              height: 75,
              child: TextField(
                controller: controllerJudul,
                maxLength: 15,
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  hintText: 'Judul Tugas',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: heightBody * 0.05,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white24,
              ),
              child: TextField(
                controller: controllerDeskripsi,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Deskripsi Tugas',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
