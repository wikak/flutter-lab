import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fromCurrency = "USD";
  String toCurrency = "EUR";
  double rate = 0.0;
  double total = 0.0;
  TextEditingController amountController = TextEditingController();
  List<String> currencies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1d2630),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(40),
                child: Image.asset(
                  'images/currency.png',
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: "Amount",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white))),
                  onChanged: (value) {
                    if (value != '') {
                      setState(() {
                        double amount = double.parse(value);
                        total = amount * rate;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 100,
                      child: DropdownButton<String>(
                          value: fromCurrency,
                          isExpanded: true,
                          style: TextStyle(color: Colors.white),
                          items: currencies.map((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              fromCurrency = newValue!;
                              // _getRate();
                            });
                          }),
                    ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.swap_horiz,
                          size: 40,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 100,
                      child: DropdownButton<String>(
                          value: toCurrency,
                          isExpanded: true,
                          style: TextStyle(color: Colors.white),
                          items: currencies.map((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              toCurrency = newValue!;
                              // _getRate();
                            });
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
