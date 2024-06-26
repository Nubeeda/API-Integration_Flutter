import 'package:firstapi_test/apipost/loading.dart';
import 'package:flutter/material.dart';

import 'apicustom/loading.dart';
import 'dummymodel/loading.dart';

void main() {
  runApp(const PostsApi());
}

class PostsApi extends StatefulWidget {
  const PostsApi({super.key});

  @override
  State<PostsApi> createState() => _PostsApiState();
}

class _PostsApiState extends State<PostsApi> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loadingScreen(),
    );
  }
}
