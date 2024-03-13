import 'package:flutter/material.dart';

AppBar appBarWidget({required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    backgroundColor: const Color.fromARGB(255, 101, 198, 243),
  );
}
