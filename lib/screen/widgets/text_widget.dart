import 'package:flutter/material.dart';

Text textWidget({required String text}) {
    return Text(
      text,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
    );
  }