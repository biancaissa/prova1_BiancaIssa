import 'package:flutter/material.dart';

import 'operation__button_widget.dart';

class OperationsWidget extends StatelessWidget {
  final VoidCallback addition;
  final VoidCallback subtraction;
  final VoidCallback multiplication;
  final VoidCallback division;

  const OperationsWidget({
    Key? key,
    required this.addition,
    required this.subtraction,
    required this.multiplication,
    required this.division,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OperationButtonWidget(
            onPressed: addition,
            text: 'Adição',
          ),
          OperationButtonWidget(
            onPressed: subtraction,
            text: 'Subtração',
          ),
          OperationButtonWidget(
            onPressed: multiplication,
            text: 'Multiplicação',
          ),
          OperationButtonWidget(
            onPressed: division,
            text: 'Divisão',
          ),
        ],
      ),
    );
  }
}
