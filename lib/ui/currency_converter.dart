import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  TextEditingController toController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  String fromCurr = 'IDR';
  String toCurr = 'USD';
  double result = 0.0;

  @override
  void initState() {
    toController = TextEditingController();
    super.initState();
  }

  void _doConversion() {
    double input = double.tryParse(fromController.text) ?? 0.0;
    if (fromCurr == 'IDR' && toCurr == 'USD') {
      result = input * 0.000068;
    } else if (fromCurr == 'USD' && toCurr == 'IDR') {
      result = input * 14802.00;
    } else if (fromCurr == 'IDR' && toCurr == 'KRW') {
      result = input * 0.090;
    } else if (fromCurr == 'KRW' && toCurr == 'IDR') {
      result = input * 11.08;
    } else if (fromCurr == 'USD' && toCurr == 'KRW') {
      result = input * 1335.95;
    } else if (fromCurr == 'KRW' && toCurr == 'USD') {
      result = input * 0.00075;
    }

    setState(() {
      toController.text = result.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
        backgroundColor: Colors.orange[700],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ListTile(
                    title: TextField(
                      controller: fromController,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: true)
                    ),
                    trailing: DropdownButton <String>(
                      value: fromCurr,
                      onChanged: (String? newValue) {
                        setState(() {
                          fromCurr = newValue!;
                        });
                        _doConversion();
                      },
                      items: ['IDR', 'USD', 'KRW']
                          .map((value) =>
                          DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          )).toList(),
                    )
                ),
                IconButton(
                  icon: Icon(Icons.arrow_downward),
                  onPressed: (){
                    _doConversion();
                  },
                ),
                ListTile(
                    title:
                    Chip(
                      label: result != null ?
                      Text(
                        result.toString(),
                        style: Theme.of(context).textTheme.headline3,
                      ) : Text(""),
                      backgroundColor: Colors.orangeAccent,
                    ),
                    trailing: DropdownButton <String>(
                      value: toCurr,
                      onChanged: (String? newValue) {
                        setState(() {
                          toCurr = newValue!;
                        });
                      },
                      items: ['IDR', 'USD', 'KRW']
                          .map((value) =>
                          DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          )).toList(),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
