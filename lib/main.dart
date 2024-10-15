/* Nombre del archivo: main.dart
* Propósito : Ejercicio 01 Definir una clase abstracta Operacion con métodos matemáticos básicos
*            e implementarla en una clase derivada para realizar operaciones.
* Autor: Asistente IA
* Fecha de Modificación: 15 de octubre de 2024
*/

import 'package:flutter/material.dart';

// Clase abstracta Operacion
abstract class Operacion {
  double sumar(double a, double b);
  double restar(double a, double b);
  double multiplicar(double a, double b);
}

// Clase derivada Calculadora
class Calculadora extends Operacion {
  // método suma
  @override
  double sumar(double a, double b) {
    return a + b;
  }

  // método resta
  @override
  double restar(double a, double b) {
    return a - b;
  }

  // método multiplicacion
  @override
  double multiplicar(double a, double b) {
    return a * b;
  }
}

// Aplicación Flutter
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraScreen(),
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  // Instancia de la calculadora
  Calculadora calc = Calculadora();

  // Controladores para los campos de entrada
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  String _resultado = '';

  // Funciones para realizar las operaciones
  void _sumar() {
    double num1 = double.parse(_num1Controller.text);
    double num2 = double.parse(_num2Controller.text);
    setState(() {
      _resultado = 'Suma: ${calc.sumar(num1, num2)}';
    });
  }

  void _restar() {
    double num1 = double.parse(_num1Controller.text);
    double num2 = double.parse(_num2Controller.text);
    setState(() {
      _resultado = 'Resta: ${calc.restar(num1, num2)}';
    });
  }

  void _multiplicar() {
    double num1 = double.parse(_num1Controller.text);
    double num2 = double.parse(_num2Controller.text);
    setState(() {
      _resultado = 'Multiplicación: ${calc.multiplicar(num1, num2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora en Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _sumar,
                  child: Text('Sumar'),
                ),
                ElevatedButton(
                  onPressed: _restar,
                  child: Text('Restar'),
                ),
                ElevatedButton(
                  onPressed: _multiplicar,
                  child: Text('Multiplicar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
