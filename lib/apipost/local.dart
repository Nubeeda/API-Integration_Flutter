// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// import '../Model/PostsModel.dart';
//
// class local extends StatefulWidget {
//   const local({super.key});
//
//   @override
//   State<local> createState() => _localState();
// }
//
// class _localState extends State<local> {
//
//   List<Postsmodel> locallist=[];
//
//   Future<List<Postsmodel>> getposts() async{
//     final Response =await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
//
//     var data = jsonDecode(Response.body.toString());
//     locallist.clear();
//     if(Response.statusCode==200){
//       for(Map i in data){
//         locallist.add(Postsmodel.fromJson(i));
//       }
//       return locallist;
//     }else{
//       return locallist;
//     }
//
// }
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("PostsList",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),
//         ),
//         backgroundColor:Colors.teal,
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       backgroundColor: Colors.black45,
//       body: Column(children: [
//         FutureBuilder(
//             future:getposts() ,
//             builder: (context, snapshot) {
//               if(snapshot.hasData){
//                 return ListView.builder(
//                   itemCount:locallist.length ,
//                     itemBuilder:(context, index) {
//                      return Container(
//                        padding:const EdgeInsets.all(10.0),
//                        margin:const EdgeInsets.all(10.0),
//                        decoration:const BoxDecoration(
//                          color: Colors.white,
//                          boxShadow:[ BoxShadow(
//                            color: Colors.white,
//                            blurStyle: BlurStyle.inner,
//                            spreadRadius: 2.0,
//                            blurRadius: 2.0,
//                          )]
//                        ),
//                        child: Column(children: [
//                          Row(
//                            children: [
//                          Text(locallist[index].id.toString(), style: const TextStyle(
//                                   backgroundColor: Colors.orangeAccent,
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                 ),),
//                                 const SizedBox(width: 150.0,),
//                                 const Text("Title", style: TextStyle(
//                                   backgroundColor: Colors.orangeAccent,
//                                   color: Colors.white,
//                                 ),),
//                              const SizedBox(height: 5.0,),
//                             Text(locallist[index].title.toString()),
//
//                             const SizedBox(height: 5.0,),
//                             const Text("Desription", style: TextStyle(
//                               backgroundColor: Colors.orangeAccent,
//                               color: Colors.white,
//                             ),),
//
//                             const SizedBox(height: 5.0,),
//                             Text(locallist[index].body.toString()),
//
//                            ],
//                          ),
//
//                        ],),
//                      ) ;
//                     }, );
//
//               }else{
//                 return const Center(
//                     child: Text("loading....", style: TextStyle(
//                       fontSize: 24,
//                     ),
//                     ),
//                 );
//
//               }
//
//             },)
//       ],),
//     );
//   }
// }
