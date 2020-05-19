import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'PaymentData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Payment Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const platform = const MethodChannel('samples.flutter.dev/payment');

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _payRsOne,
          child: Text('Pay 1 Rs'),
          color: Colors.blue,
          textColor: Colors.white,
        ),
      ),
    );
  }

  void _payRsOne() async{
    PaymentData payment = new PaymentData(
        userId: 1,
        userEmail: 'bhorodiya.kunal@gmail.com',
        userMobileNo: '9509645799',
        merchantIdentifier: 'T1234',
        transactionAmount: '1',
        transactionDatetime: '18-05-2020',
        transactionCurrency: "INR",
        transactionIdentifier: 'TXN4535345' + Random().nextInt(15).toString() + "" + Random().nextInt(15).toString());

    try {
      var result = await platform.invokeMethod('doPayment', payment.toJson());
      print("result  ${result}");
    } on PlatformException catch (e) {
      print("Failed to get data: '${e.message}'.");
    }

  }

}
