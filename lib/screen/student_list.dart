import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'add_student.dart';
import 'controller/controller.dart';
import 'widgets/appbar_wiget.dart';
import 'widgets/card_widget.dart';

class Students extends StatelessWidget {
  Students({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<StudentController>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddStudent());
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.person_add,
          color: Colors.black,
        ),
      ),
      appBar: appBarWidget(title: 'Student Details'),
      body: Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: controller.studentBox.values.isNotEmpty
                    ? Consumer<StudentController>(
                        builder: (context, value, child) {
                          return GridView.builder(
                            itemCount: controller.studentBox.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 6 / 9,
                            ),
                            itemBuilder: (context, index) {
                              final data = controller.studentBox.getAt(index);
                              return cardWidget(
                                details: data!,
                                index: index,
                                context: context,
                              );
                            },
                          );
                        },
                      )
                    :const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    SizedBox(height: 30,),    
                   Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Image(image: AssetImage("lib/img/WhatsApp_Image_2024-03-01_at_3.09.27_PM-removebg-preview.png")),
                   ),
                        Text('No Students Found'),
                         SizedBox(height: 50,), 
                      ],
                    )),

          ),
        ],
      ),
    );
  }
}
