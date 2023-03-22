import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMICalculator extends StatefulWidget {
  BMICalculator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _bmi = 0;
  double _height = 0;
  double _weight = 0;

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 194, 194),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal[900],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(),
              ),
              child: Text(
                'Height',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Slider(
              min: 0,
              max: 200,
              value: _height,
              activeColor: Colors.teal[900],
              inactiveColor: Colors.white,
              divisions: 200,
              label: '${_height.round()}',
              onChanged: (value) {
                setState(() {
                  _height = value;
                });
              },
            ),
            // TextField(
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(20),
            //   )),
            //   keyboardType: TextInputType.number,
            //   onChanged: (value) {
            //     setState(() {
            //       _height = double.parse(value);
            //     });
            //   },
            // ),
            SizedBox(height: 20),
            Text(
              'Weight',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: Colors.teal[900],
              decoration: InputDecoration(
                  focusColor: Colors.teal[900],
                  hoverColor: Colors.teal[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal.shade900),
                  )),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _weight = double.parse(value);
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal[900]),
              ),
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            Text(
              'Your BMI is: $_bmi',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
