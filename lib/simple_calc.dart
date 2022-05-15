import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontsize = 40.0;
  double resultFontsize = 48.0;

  buttonPressed(String buttontext) {
    setState(() {
      if (buttontext == "AC") {
        equation = "0";
        result = "0";
        double equationFontsize = 40.0;
        double resultFontsize = 48.0;
      } else if (buttontext == "X") {
        double equationFontsize = 40.0;
        double resultFontsize = 48.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttontext == "=") {
        double equationFontsize = 40.0;
        double resultFontsize = 48.0;
        expression = equation;
        expression = expression.replaceAll("X", "*");
        expression = expression.replaceAll("/", "/");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontsize = 40.0;
        resultFontsize = 48.0;
        if (equation == "0") {
          equation = buttontext;
        }
        equation = equation + buttontext;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 2, 58, 105),
          title: Center(
            child: Text(
              ' Calculator',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        body: Container(
          color: Color.fromARGB(255, 2, 58, 105),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  color: Colors.cyan,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
                  child: Text(
                    equation,
                    style: TextStyle(fontSize: equationFontsize),
                  ),
                ),
              ),
              Container(
                color: Colors.cyanAccent,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Text(
                  result,
                  style: TextStyle(fontSize: resultFontsize),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonInput(buttontext: "AC", colour: Colors.blue),
                  buttonInput(buttontext: "X", colour: Colors.pink),
                  buttonInput(buttontext: "%", colour: Colors.orange),
                  buttonInput(buttontext: "/", colour: Colors.brown),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonInput(buttontext: "7", colour: Colors.blue),
                  buttonInput(buttontext: "8", colour: Colors.pink),
                  buttonInput(buttontext: "9", colour: Colors.orange),
                  buttonInput(buttontext: "*", colour: Colors.brown),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonInput(buttontext: "4", colour: Colors.blue),
                  buttonInput(buttontext: "5", colour: Colors.pink),
                  buttonInput(buttontext: "6", colour: Colors.orange),
                  buttonInput(buttontext: "-", colour: Colors.brown),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonInput(buttontext: "1", colour: Colors.blue),
                  buttonInput(buttontext: "2", colour: Colors.pink),
                  buttonInput(buttontext: "3", colour: Colors.orange),
                  buttonInput(buttontext: "+", colour: Colors.brown),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonInput(buttontext: ".", colour: Colors.blue),
                  buttonInput(buttontext: "0", colour: Colors.pink),
                  buttonInput(buttontext: "00", colour: Colors.orange),
                  buttonInput(buttontext: "=", colour: Colors.brown),
                ],
              ),
            ],
          ),
        ));
  }

  Widget buttonInput({String? buttontext, Color? colour}) {
    return Material(
      color: colour,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        side: BorderSide(
          color: Colors.white38,
          width: 3,
          style: BorderStyle.solid,
        ),
      ),
      child: MaterialButton(
        onPressed: () => buttonPressed(buttontext.toString()),
        height: 70,
        minWidth: 70,
        child: Text(
          buttontext.toString(),
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
