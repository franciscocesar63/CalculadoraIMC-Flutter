import 'dart:math';

import 'package:atividade_imc/models/BuildTextView.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  TextEditingController _peso = new TextEditingController();

  TextEditingController _altura = new TextEditingController();

  var _resultado = "Indefinido";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Cálculo IMC"),
      ),
      body: _calculoIMC(),
    );
  }

  _calculoIMC() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //  crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "IMC",
          style: TextStyle(fontSize: 75, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: buildTextFieldSemLabel(
            control: _peso,
            hint: "Peso",
            type: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: buildTextFieldSemLabel(
            control: _altura,
            hint: "Altura em cm",
            type: TextInputType.number,
          ),
        ),
        Divider(),
        RaisedButton(
          onPressed: () {
            _realizarCalculo();
//            print("opa");
          },
          child: Text("Calcular"),
        ),
        Divider(),
        Text("Resultado",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Text(
          "$_resultado",
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  void _realizarCalculo() {
    if (_peso.text == "") {
      setState(() {
        _resultado = "Dados incorretos...";
        return;
      });
    } else if (_altura.text == "") {
      setState(() {
        _resultado = "Dados incorretos...";
        return;
      });
    }
    var peso = int.parse(_peso.text);
    var altura = int.parse(_altura.text) / 100;
    var calculo = peso / (altura * altura);

    if (calculo < 18.5) {
      setState(() {
        _resultado = "Abaixo do Peso";
      });
    } else if (calculo >= 18.5 && calculo <= 24.9) {
      setState(() {
        _resultado = "Peso Normal";
      });
    } else if (calculo >= 25 && calculo <= 29.9) {
      setState(() {
        _resultado = "Sobrepeso";
      });
    } else if (calculo >= 30 && calculo <= 34.9) {
      setState(() {
        _resultado = "Obesidade grau 1";
      });
    } else if (calculo >= 35 && calculo <= 39.9) {
      setState(() {
        _resultado = "Obesidade grau 2";
      });
    } else if (calculo >= 40) {
      setState(() {
        _resultado = "Obesidade grau 3";
      });
    }
  }
}
