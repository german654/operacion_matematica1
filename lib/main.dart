/* Nombre del archivo: operacion_matematica.dart
* Propósito : Ejercicio 02 Realizar una clase operación con los métodos suma, resta y multiplicación.
*             Después,  extender en una clase derivada.
* Autor: German
* Fecha de Modificación: 15 de octubre de 2024
*/
import 'package:flutter/material.dart';

// Definir la clase Operacion
class Operacion {
  // Métodos para realizar las operaciones básicas
  double sumar(double a, double b) {
    return a + b;
  }

  double restar(double a, double b) {
    return a - b;
  }

  double multiplicar(double a, double b) {
    return a * b;
  }
}

// Clase derivada que extiende de Operacion
class CalculadoraAvanzada extends Operacion {
  // Método adicional para calcular el cociente (división)
  double dividir(double a, double b) {
    if (b == 0) {
      throw Exception('No se puede dividir por cero');
    }
    return a / b;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Avanzada',
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
  // Instancia de la calculadora avanzada
  CalculadoraAvanzada calc = CalculadoraAvanzada();

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

  void _dividir() {
    double num1 = double.parse(_num1Controller.text);
    double num2 = double.parse(_num2Controller.text);
    try {
      setState(() {
        _resultado = 'División: ${calc.dividir(num1, num2)}';
      });
    } catch (e) {
      setState(() {
        _resultado = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Avanzada'),
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
                ElevatedButton(
                  onPressed: _dividir,
                  child: Text('Dividir'),
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
