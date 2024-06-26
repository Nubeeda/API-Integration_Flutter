import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

import '../model/model2.dart';

class products extends StatefulWidget {
  const products({super.key});

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
  List<model2> productlist = [];
  Future<List<model2>> getproduct() async {
    final response = await get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    productlist.clear();

    if (response.statusCode == 200) {
      for (Map i in data) {
        productlist.add(model2.fromJson(i));
      }
      return productlist;
    } else {
      return productlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "photoes fix",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getproduct(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return ListView.builder(
                        itemCount: productlist.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                                color: Colors.black12,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.cyan,
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                  backgroundImage: NetworkImage(productlist[index].url.toString()),
                              ),
                              title: Row(
                                children: [
                                  Text(productlist[index].id.toString(),
                             style:const TextStyle(color: Colors.white), ),
                                const  SizedBox(width: 150,),
                                 const Text("Title",style: TextStyle(color: Colors.white,
                                  backgroundColor: Colors.deepOrangeAccent),),
                                 const SizedBox(height: 20.0,),
                                ],
                              ),

                              subtitle: Text(productlist[index].title.toString(),
                                style:const TextStyle(color: Colors.white),),
                            )
                          );
                        });
                  } else {
                    return const SpinKitWave(
                        color: Colors.cyan,
                        size: 80.0,
                      );

                  }
                }),
          ),
        ],
      ),
    );
  }
}
