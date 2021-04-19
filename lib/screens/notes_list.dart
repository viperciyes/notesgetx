import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgetx/screens/controller.dart';
import 'package:notesgetx/screens/my_note.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NoteController nc = Get.put(NoteController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("TODO Getx"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => MyNote());
        },
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Obx(
            () => nc.notes.length == 0
                ? Center(child: Text("No Notes here..."))
                : ListView.builder(
                    itemCount: nc.notes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            nc.notes[index].title,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          leading: Text(
                            (index + 1).toString() + ".",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.create),
                                  onPressed: () {
                                    Get.to(() => MyNote(index: index));
                                  }),
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    Get.defaultDialog(
                                        title: 'Delete Note',
                                        middleText: nc.notes[index].title,
                                        onCancel: () => Get.back(),
                                        onConfirm: () {
                                          nc.notes.removeAt(index);
                                          Get.back();
                                        });
                                  })
                            ],
                          ),
                        ),
                      );
                    }),
          ),
        ),
      ),
    ));
  }
}
