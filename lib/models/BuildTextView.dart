import 'package:flutter/material.dart';

Widget buildTextFieldSemLabel(
    {String hint, TextEditingController control, TextInputType type, Icon icon}) {
  return TextField(
    controller: control,
    keyboardType: type,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      //labelText: label,
      labelStyle: TextStyle(
        fontSize: 25,
      ),
      hintText: hint,
      hintStyle: TextStyle(fontSize: 20),
     // helperText: "* Obrigatório",
      helperStyle: TextStyle(color: Colors.red),
      //icon: icon,
    ),
  );
}

Widget buildTextFieldComLabel(
    {String label,
    String hint,
    TextEditingController control,
    TextInputType type}) {
  return TextField(
    controller: control,
    keyboardType: type,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
        ),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 20),
        helperText: "* Obrigatório",
        helperStyle: TextStyle(color: Colors.red)),
  );
}
