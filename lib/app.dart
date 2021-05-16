import 'package:flutter/material.dart';
import 'package:flutter_app/second_page.dart';
import 'package:flutter_app/user_provider.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
      child: MaterialApp(
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
          primaryColor: Colors.green,
          elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle()),
        ),
        home: HomePage(),
      ),
    );
  }
}

Route onGenerateRoute(RouteSettings? routeSettings) {
  if (routeSettings!.name == 'second') {
    String input = (routeSettings.arguments as List<Object>).join('-');
    return MaterialPageRoute(
        builder: (ctx) => SecondPage(
              input: input,
            ));
  } else {
    return MaterialPageRoute(
        builder: (ctx) => Center(
              child: Text('Unknown page'),
            ));
  }
}
