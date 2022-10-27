import 'package:flutter/material.dart';

class ProfitCalculator extends StatefulWidget {
  const ProfitCalculator({Key? key}) : super(key: key);

  @override
  State<ProfitCalculator> createState() => _ProfitCalculatorState();
}

class _ProfitCalculatorState extends State<ProfitCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Profit Calculator',
            ),
          ],
        ),
      ),
    );
  }
}
