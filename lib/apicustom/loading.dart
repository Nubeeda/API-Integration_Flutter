import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'photos.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({super.key});

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const photos()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/nature.jpg"),
          fit: BoxFit.cover),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              BackdropFilter(
                  filter:ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0,),
              child: Container(
                color: Colors.black,
              ),),
          Text("Loading...",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26.0),),
              SpinKitThreeInOut(
                size: 50.0,
                itemBuilder: (context, index) {
                  return DecoratedBox(decoration: BoxDecoration(
                    color: index.isEven? Colors.grey:Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ));
                },
              )
            ]) ,
      )
    );
  }
}
