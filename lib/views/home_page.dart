import 'package:flutter/material.dart';
import 'package:flutter_crud_app/controllers/note_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NoteController notesController = Get.put(NoteController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FIREBASE CRUD",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      print(index.toString());
                    },
                    title: Text('Map'),
                    subtitle: Text("Sub title"),
                    trailing: Icon(Icons.delete),
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            Wrap(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: notesController.title,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.input),
                            fillColor: Colors.grey[300],
                            filled: true,
                            hintText: "Enter a Title",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: notesController.description,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.input),
                            fillColor: Colors.grey[300],
                            filled: true,
                            hintText: "Enter a Desription",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            OutlinedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("Cancel")),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  notesController.createNote();
                                  Get.back();
                                },
                                child: Text("Save"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isScrollControlled:
                true, // Ensures the BottomSheet can expand fully
          );
        },
        tooltip: "Add a note",
        child: const Icon(Icons.add),
      ),
    );
  }
}
