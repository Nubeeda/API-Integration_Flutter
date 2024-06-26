
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';


class photos extends StatefulWidget {
  const photos({super.key});

  @override
  State<photos> createState() => _photosState();
}

class _photosState extends State<photos> {
  List<Photos> photosList = [];
  Future<List<Photos>> getPhotos() async {
    final response =
    await get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    var data = jsonDecode(response.body.toString());
    photosList.clear();

    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title:i["title"], url:i["Url"], id:i["id"]);
        photosList.add(photos);
      }
      return photosList;
    } else {
      return photosList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        shadowColor: Colors.cyan,
        title: Text("Photos",style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
              future: getPhotos(),
              builder: (context,snapShot){
                if(!snapShot.hasData){

                  return Center(
                  child: SpinKitWave(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? const Color(0xff4298b5) : Colors
                            .lightBlueAccent,
                      ),
                    );
                  })
                  );
                }else{
                  return ListView.builder(
                    itemCount:photosList.length ,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(photosList[index].url.toString()),
                          backgroundColor: Colors.greenAccent,
                        ),
                        title: Text("Note Id : ${photosList[index].id.toString()}"),
                        subtitle: Text(photosList[index].title.toString()),
                      );
                    },);
                }
              }),
        ),
      ],),
    );
  }
}


class Photos {
  String? title,url;
  int? id;
  Photos({required this.title,required this.url,required this.id});

}



