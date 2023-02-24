import 'package:book_manger/route/book_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();

  runApp(MaterialApp.router(
    routerConfig: BookRouter().router,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.indigo),
    title: "Book Manager",
  ));
}
