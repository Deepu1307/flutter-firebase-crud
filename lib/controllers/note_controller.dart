

import 'package:flutter/widgets.dart';
import 'package:flutter_crud_app/models/note_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class NoteController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  
  final db = FirebaseFirestore.instance;

  void createNote() async {
    var note = NoteModel(title: title.text, description: description.text);

    DocumentReference docRef = await db.collection("Notes").add(note.toJson());


  }
}