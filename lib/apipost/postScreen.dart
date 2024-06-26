
import 'dart:convert';
import 'package:firstapi_test/Model/PostsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {


  List<Postsmodel> postsList = [];

  Future<List<Postsmodel>> getPosts() async {

    final response = await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    var data = jsonDecode(response.body.toString());

    postsList.clear();

    if(response.statusCode == 200){

      for(Map i in data){
        postsList.add(Postsmodel.fromJson(i));
      }

      return postsList;

    }else{
      return postsList;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Posts Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [

          Expanded(
            child: FutureBuilder(
              future: getPosts(),
              builder: (context, snapShot){

                if(snapShot.hasData){
                  return ListView.builder(
                    itemCount: postsList.length,
                    itemBuilder: (context, index){
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent.withOpacity(0.5),
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [

                            Row(
                              children: [
                                Text(postsList[index].id.toString(), style: const TextStyle(
                                  backgroundColor: Colors.deepOrangeAccent,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),),
                                const SizedBox(width: 200.0,),
                                const Text("Title", style: TextStyle(
                                  backgroundColor: Colors.deepOrangeAccent,
                                  color: Colors.white,
                                ),),
                              ],
                            ),


                            const SizedBox(height: 5.0,),
                            Text(postsList[index].title.toString(),
                            style: TextStyle(color: Colors.black),),

                            const SizedBox(height: 5.0,),
                            const Text("Desription", style: TextStyle(
                              backgroundColor: Colors.blue,
                              color: Colors.white,
                            ),),

                            const SizedBox(height: 5.0,),
                            Text(postsList[index].body.toString()),



                          ],
                        ),
                      );
                    },
                  );
                }else{
                  return const Center(
                    child: Text("loading....", style: TextStyle(
                      fontSize: 24,
                    ),),
                  );
                }

              },
            ),
          ),


        ],
      ),
    );
  }
}

