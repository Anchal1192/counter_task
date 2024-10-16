import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
     // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ChartSampleData> _chartData;
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EUR/USD Chart")),
      body: Stack(
        children: [
          SfCartesianChart(
            title: ChartTitle(text: 'EUR/USD M5'),
            legend: Legend(isVisible: false),
            trackballBehavior: _trackballBehavior,
            series: <CandleSeries>[
              CandleSeries<ChartSampleData, DateTime>(
                dataSource: _chartData,
                name: 'EUR/USD',
                xValueMapper: (ChartSampleData data, _) => data.x,
                lowValueMapper: (ChartSampleData data, _) => data.low,
                highValueMapper: (ChartSampleData data, _) => data.high,
                openValueMapper: (ChartSampleData data, _) => data.open,
                closeValueMapper: (ChartSampleData data, _) => data.close,
                bearColor: Colors.red, // Matching bear (down) candles
                bullColor: Colors.green, // Matching bull (up) candles
                enableSolidCandles: true,
              ),
            ],
            primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat('d MMM HH:mm'), // Format to show day, month, hour, and minute (e.g., 13 Oct 14:00)
              intervalType: DateTimeIntervalType.minutes,
              interval: 5, // Optional: Adjust this based on the data intervals
              majorGridLines: MajorGridLines(width: 0,  // This creates dotted/dashed lines
                ),

            ),
            primaryYAxis: NumericAxis(
              minimum: 1.0900, // Set the minimum value of Y-axis based on your data
              maximum: 1.0918, // Set the maximum value of Y-axis based on your data
              interval: 0.0001, // Set the interval for better precision, depending on your data points
              numberFormat: NumberFormat('#.####'), // Ensures the Y-axis shows values like 1.0900, 1.0902, etc.
                majorGridLines: MajorGridLines(
                  width:0 // Adjust the width of the grid lines
                ),
              opposedPosition: true// Optional: Removes grid lines for a cleaner look
            ),
          ),
          Positioned(
            left: 10, // Adjust left position
            top: 50, // Adjust top position
            child: Container(
              padding: EdgeInsets.all(8),
              child: Text(
                'EUR/USD',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ChartSampleData> getChartData() {
    return <ChartSampleData>[
      ChartSampleData(
          x: DateTime(2024, 10, 15, 13, 35),
          open: 1.0912,
          high: 1.0916,
          low: 1.0909,
          close: 1.0915),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 13, 40),
          open: 1.0915,
          high: 1.0918,
          low: 1.0910,
          close: 1.0910),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 13, 45),
          open: 1.0910,
          high: 1.0912,
          low: 1.0906,
          close: 1.0908),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 13, 50),
          open: 1.0908,
          high: 1.0911,
          low: 1.0905,
          close: 1.0906),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 13, 55),
          open: 1.0906,
          high: 1.0910,
          low: 1.0902,
          close: 1.0909),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 00),
          open: 1.0909,
          high: 1.0913,
          low: 1.0907,
          close: 1.0912),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 05),
          open: 1.0912,
          high: 1.0915,
          low: 1.0908,
          close: 1.0909),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 10),
          open: 1.0909,
          high: 1.0914,
          low: 1.0906,
          close: 1.0910),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 15),
          open: 1.0910,
          high: 1.0915,
          low: 1.0905,
          close: 1.0907),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 20),
          open: 1.0907,
          high: 1.0911,
          low: 1.0903,
          close: 1.0905),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 25),
          open: 1.0905,
          high: 1.0909,
          low: 1.0902,
          close: 1.0908),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 30),
          open: 1.0908,
          high: 1.0912,
          low: 1.0904,
          close: 1.0910),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 35),
          open: 1.0910,
          high: 1.0914,
          low: 1.0907,
          close: 1.0912),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 40),
          open: 1.0912,
          high: 1.0917,
          low: 1.0909,
          close: 1.0914),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 45),
          open: 1.0914,
          high: 1.0918,
          low: 1.0911,
          close: 1.0915),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 50),
          open: 1.0915,
          high: 1.0919,
          low: 1.0912,
          close: 1.0917),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 14, 55),
          open: 1.0917,
          high: 1.0920,
          low: 1.0914,
          close: 1.0919),
      ChartSampleData(
          x: DateTime(2024, 10, 15, 15, 00),
          open: 1.0919,
          high: 1.0923,
          low: 1.0916,
          close: 1.0920),
    ];
  }

}

class ChartSampleData {
  ChartSampleData({
    this.x,
    this.open,
    this.close,
    this.low,
    this.high,
  });

  final DateTime? x;
  final double? open;
  final double? close;
  final double? low;
  final double? high;
}



class CurrencyPair {
  final String name;
  final String bid;
  final double ask;
  final double change;
  final String time;
  final int total;

  CurrencyPair({
    required this.name,
    required this.bid,
    required this.ask,
    required this.change,
    required this.time,
    required this.total,
  });
}

class CurrencyPairList extends StatelessWidget {
  final List<CurrencyPair> currencyPairs;

  const CurrencyPairList({
    Key? key,
    required this.currencyPairs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: currencyPairs.length,
        itemBuilder: (context, index) {
          final currencyPair = currencyPairs[index];
          String mainPart = currencyPair.bid.length > 2 ? currencyPair.bid.substring(0, currencyPair.bid.length - 2) : currencyPair.bid;
          String lastTwoDigits =  currencyPair.bid.length > 2 ?  currencyPair.bid.substring(currencyPair.bid.length - 2) : "";

          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    children: [
                      Text(
                        '${currencyPair.change.toStringAsFixed(2)}',
                        style: TextStyle(
            color: Colors.grey
                        ),),
                      SizedBox(width: 5,),
                      Text(
                      '${currencyPair.change.toStringAsFixed(2)}%',
                      style: TextStyle(
                        color: currencyPair.change > 0 ? Colors.blue : Colors.red,
                      ),),
                    ],
                  ),
                      Text(currencyPair.name,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Text('${currencyPair.time}',style: TextStyle(color: Colors.white)),
                          SizedBox(width: 6,),
                          Transform.rotate(
                            angle: math.pi / 2, // Rotate 90 degrees (in radians)
                            child: Text(
                              '][', // The text you want to rotate
                              style: TextStyle(fontSize: 12,color: Colors.grey), // Adjust size as needed
                            ),),
                          SizedBox(width: 6,),
                          Text('${currencyPair.total}',style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ],
                  ),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 24, // Base font size for the main text
                                color: Colors.black, // Text color
                              ),
                              children: <InlineSpan>[  // Use InlineSpan instead of TextSpan
                                TextSpan(
                                  text: mainPart,
                                  style: TextStyle(fontSize: 18,color: Colors.blue), // Main part
                                ),
                                TextSpan(
                                  text: lastTwoDigits, // The first digit of lastTwoDigits
                                  style: TextStyle(fontSize: 26,color: Colors.blue), // Larger font size for this part
                                ),
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(2, -18), // Adjust the offset to position superscript
                                    child: Text(
                                      lastTwoDigits[1], // The second digit, shown as superscript
                                      textScaleFactor: 1, // Scale down the superscript
                                      style: TextStyle(color: Colors.black,fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          RichText(
                            text: TextSpan(
                              // style: TextStyle(
                              //   fontSize: 24, // Base font size for the main text
                              //   color: Colors.black, // Text color
                              //),
                              children: <InlineSpan>[  // Use InlineSpan instead of TextSpan
                                TextSpan(
                                  text: mainPart,
                                  style: TextStyle(fontSize: 18,color: Colors.blue), // Main part
                                ),
                                TextSpan(
                                  text: lastTwoDigits, // The first digit of lastTwoDigits
                                  style: TextStyle(fontSize: 26,color: Colors.blue), // Larger font size for this part
                                ),
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(2, -18), // Adjust the offset to position superscript
                                    child: Text(
                                      lastTwoDigits[1], // The second digit, shown as superscript
                                      textScaleFactor: 1, // Scale down the superscript
                                      style: TextStyle(color: Colors.blue,fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('L:${currencyPair.ask}',style: TextStyle(color: Colors.grey),),
                          SizedBox(width: 30,),
                          Text('R:${currencyPair.ask}',style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),

              ],
            ),
          );
        },
      ),
    );
  }
  String extractBase(double value) {
    String valueStr = value.toStringAsFixed(3); // Ensure 3 decimal places
    return valueStr.substring(0, valueStr.length - 2);
  }

  String extractLastTwoDigits(double value) {
    String valueStr = value.toStringAsFixed(3);
    return valueStr.substring(valueStr.length - 2);
  }

}




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final currencyPairs = [
      CurrencyPair(name: 'EURHUF', bid: "400.18", ask: 400.20, change: -0.16,time: "16:14:00",total: 20),
      CurrencyPair(name: 'EURNOK', bid: "11.7855", ask: 11.7964, change: 0.47,time: "16:14:00",total: 20),
      // ... other currency pairs
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text('Financial Trading App',style: TextStyle(color: Colors.grey),),
      ),
      body: CurrencyPairList(currencyPairs: currencyPairs),
    );
  }
}