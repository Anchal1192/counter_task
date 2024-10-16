import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  int countText = 0;

  void incrementCounter(){
    setState(() {
      countText ++;
    });
  }
  void decrementCounter(){
    setState(() {
      countText --;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("counter text $countText"),
          SizedBox(height: 10,),
      InkWell(
        onTap: (){
          incrementCounter();
        },
        child: Container(
          height: 40,
          // width: 100,
          color: Colors.amber,
          alignment: Alignment.center,
          child: Text('AddCounter'),
        ),
      ),
        SizedBox(height: 10,),
        InkWell(
          onTap: (){
            decrementCounter();
          },
          child: Container(
            height: 40,
            // width: 100,100
            color: Colors.amber,
            alignment: Alignment.center,
            child: Text('DecrementCounter'),
          ),
        )
      ],),
    );
  }
}
