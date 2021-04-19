import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgetx/screens/controller.dart';

import '../model.dart';

class MyNote extends StatelessWidget {
  int index;
  MyNote({this.index});

  @override
  Widget build(BuildContext context) {
    final NoteController nc = Get.find();
    String text = "";
    text = index == null ? "" : nc.notes[index].title;
    TextEditingController textEditingController =
        TextEditingController(text: text);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: index == null ? Text("Create Note") : Text("Update Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 500.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  autofocus: true,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: 'Create a new Note',
                    labelText: 'My Note',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      child: Text("Cancel"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        Get.back();
                      }),
                  ElevatedButton(
                      child: Text(index == null ? "Add" : "Update"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        if (index == null) {
                          nc.notes.add(Note(title: textEditingController.text));
                        } else {
                          var updateNote = nc.notes[index];
                          updateNote.title = textEditingController.text;
                          nc.notes[index] = updateNote;
                        }

                        Get.back();
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
