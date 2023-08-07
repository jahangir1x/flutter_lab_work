import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  double _result = 0.0;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        try {
          _result = eval(_input);
        } catch (e) {
          _result = 0.0;
        }
        _input = '';
      } else if (buttonText == 'C') {
        _input = '';
      } else {
        _input += buttonText;
      }
    });
  }

  double eval(String expression) {
    try {
      return double.parse(expression);
    } catch (e) {
      return 0.0;
    }
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: Container(
        child: Row(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    _buildButton('7'),
                    _buildButton('4'),
                    _buildButton('1'),
                    _buildButton('0'),
                  ],
                ),
                Column(
                  children: [
                    _buildButton('8'),
                    _buildButton('5'),
                    _buildButton('2'),
                    _buildButton('.'),
                  ],
                ),
                Column(
                  children: [
                    _buildButton('9'),
                    _buildButton('6'),
                    _buildButton('3'),
                    _buildButton('='),
                  ],
                ),
                Column(
                  children: [
                    _buildButton('+'),
                    _buildButton('-'),
                    _buildButton('X'),
                    _buildButton('/'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
