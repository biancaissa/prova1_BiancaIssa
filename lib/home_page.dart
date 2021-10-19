import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/number_field_widget.dart';
import 'widgets/operation__button_widget.dart';
import 'widgets/operations_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final number1Controller = TextEditingController();
  final number2Controller = TextEditingController();
  double? result;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Column(
        children: [
          NumberFieldWidget(
            controller: number1Controller,
            title: 'Número 1',
          ),
          NumberFieldWidget(
            controller: number2Controller,
            title: 'Número 2',
          ),
          const Text('Escolha a operação desejada'),
          OperationsWidget(
            addition: () => _calculate(operation: _sum),
            division: () => _calculate(operation: _div),
            multiplication: () => _calculate(operation: _mul),
            subtraction: () => _calculate(operation: _sub),
          ),
          Visibility(
            visible: result != null,
            child: Text(
              'Resultado: $result',
            ),
          ),
          Visibility(
            visible: error.isNotEmpty,
            child: Text(
              error,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  bool _validate() =>
      number1Controller.text.isNotEmpty && number2Controller.text.isNotEmpty;
  bool _validateNumber() =>
      double.tryParse(number1Controller.text.replaceAll('.', ',')) != null &&
      double.tryParse(number2Controller.text.replaceAll('.', ',')) != null;
  double _sum(double num1, double num2) => num1 + num2;
  double _sub(double num1, double num2) => num1 - num2;
  double _mul(double num1, double num2) => num1 * num2;
  double _div(double num1, double num2) {
    if (num2 == 0) {
      error = 'Não pode dividir por 0';
      return 0;
    } else {
      return num1 / num2;
    }
  }

  void _calculate({required double Function(double, double) operation}) {
    setState(() {
      result = null;
      error = '';
      if (_validate()) {
        if (!_validateNumber()) {
          error = 'Digite numeros validos';
          return;
        }
        var num1 = double.parse(number1Controller.text.replaceAll(',', '.'));
        var num2 = double.parse(number2Controller.text.replaceAll(',', '.'));

        result = operation(num1, num2);
        if (error.isNotEmpty) result = null;
      } else {
        error = 'Preencha todos os numeros';
      }
    });
  }
}
