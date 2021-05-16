import 'package:flutter/material.dart';
import 'package:flutter_app/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  late final TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Count : ${userProvider.count}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                String input = _textController.text;

                Navigator.pushNamed(context, 'second',
                    arguments: [input, 12, 'sdfds']);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Text('Login'),
              ),
            ),
            Text('counter : $counter'),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                controller: _textController,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
            context.read<UserProvider>().increment();
          });
        },
        child: Text('Fab'),
      ),
    );
  }
}
