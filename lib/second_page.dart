import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/post_model.dart';
import 'package:flutter_app/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  String? input;

  SecondPage({this.input});

  @override
  Widget build(BuildContext context) {
    var userProvider = context.watch<UserProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userProvider.increment();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('count: ${userProvider.count.toString()}'),
      ),
      body: Center(
        child: FutureBuilder<List<PostModel>>(
          future: getData(),
          builder: (BuildContext ctx, AsyncSnapshot<List<PostModel>> snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: snapshot.data!
                    .map<Widget>(
                      (PostModel model) => Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(spreadRadius: 3, blurRadius: 5)
                          ],
                        ),
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              model.title,
                              maxLines: 1,
                            ),
                            Text(
                              model.body,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<PostModel>> getData() async {
    Uri uri = Uri.https('jsonplaceholder.typicode.com', '/posts');
    http.Response response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    List<PostModel> result = [];
    for (dynamic jsonObject in jsonData) {
      result.add(PostModel.fromJson(jsonObject));
    }
    return result;
  }
}
