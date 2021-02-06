import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationsize = 38;
  double resultsize = 48;
  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "c") {
        equation = "0";
        result = "0";
        equationsize = 38;
        resultsize = 48;
      } else if (buttonText == "⌫") {
        equationsize = 48;
        resultsize = 38;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationsize = 38;
        resultsize = 48;
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationsize = 48;
        resultsize = 38;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
      {String buttonText,
      double buttonHeight,
      Color buttonColor,
      Color textColor}) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonColor,
          border: Border.all(color: Colors.grey[900]),
        ),
        height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
        child: FlatButton(
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.normal, color: textColor),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Calcultor",
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 30, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationsize, color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultsize, color: Colors.white),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton(
                          buttonText: "c",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[900]),
                      buildButton(
                          buttonText: "⌫",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.orangeAccent[400]),
                      buildButton(
                          buttonText: "÷",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.orangeAccent[400]),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "7",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                      buildButton(
                          buttonText: "8",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                      buildButton(
                          buttonText: "9",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "4",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                      buildButton(
                          buttonText: "5",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                      buildButton(
                          buttonText: "6",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "1",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                      buildButton(
                          buttonText: "2",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                      buildButton(
                          buttonText: "3",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: ".",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                      buildButton(
                          buttonText: "0",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                      buildButton(
                          buttonText: "00",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.grey[800]),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton(
                          buttonText: "x",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.orangeAccent[400]),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "-",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.orangeAccent[400]),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "+",
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          textColor: Colors.orangeAccent[400]),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "=",
                          buttonColor: Colors.white,
                          buttonHeight: 2,
                          textColor: Colors.grey[900]),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
