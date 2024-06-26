import 'dart:async';

import 'package:firstapi_test/apipost/postScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'local.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>const PostsScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text("Loading......", style: TextStyle(fontSize: 30),),
        SpinKitThreeInOut(
          size: 50.0,
          itemBuilder: (context, index) {
            return DecoratedBox(decoration: BoxDecoration(
              color: index.isEven? Colors.grey:Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ));
          },
        )
        ],),
      ),
    );
  }
}
