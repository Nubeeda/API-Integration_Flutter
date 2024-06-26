import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dummyproducts.dart';

class Loading2Screen extends StatefulWidget {
  const Loading2Screen({super.key});

  @override
  State<Loading2Screen> createState() => _Loading2ScreenState();
}

class _Loading2ScreenState extends State<Loading2Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const products()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text("Loading...",style: TextStyle(color: Colors.white,
          fontSize: 26),
        ),

          const SizedBox(height: 20,),
      SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.green,
            ),
          );
        },
      ),
      ],),
    );

  }
}
