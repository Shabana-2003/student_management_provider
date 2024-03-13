import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/screen/controller/controller.dart';
import 'package:student_provider/screen/widgets/edit_dialogue.dart';
import '../../database/model/model.dart';
import 'text_widget.dart';

Card cardWidget(
    {required StudentModel details,
    required int index,
    required BuildContext context}) {
  final controller = Provider.of<StudentController>(context);
  return Card(
    color: const Color.fromARGB(255, 139, 206, 243),
    elevation: 19,
    shadowColor: Colors.grey,
    child: Column(
      children: [
        const Spacer(),
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          backgroundImage: FileImage(
            File(
              details.imageUrl,
            ),
          ),
        ),
        textWidget(
          text: 'Name: ${details.name}',
        ),
        textWidget(
          text: 'Age: ${details.age}'.toString(),
        ),
        textWidget(
          text: 'Domain: ${details.rollNumber}'.toString(),
        ),
        textWidget(
          text: 'Roll No: ${details.rollNumber}'.toString(),
        ),

        //const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Get.dialog(AlertDialog(
                  title: const Text('Are you sure you want to delete the data'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        controller.deleteStudent(index: index);
                        Get.back();
                        Get.snackbar('Success', 'Successfully deleted',
                            backgroundColor:
                                const Color.fromARGB(106, 54, 244, 73),
                            duration: Duration(milliseconds: 800));
                      },
                      child: const Text('yes'),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('No'))
                  ],
                ));
              },
              icon: const Icon(
                Icons.delete,
                size: 30,
              ),
            ),
            
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return editDialogue(
                        index: index, details: details, context: context);
                  },
                );
              },
              icon: const Icon(
                Icons.edit,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
