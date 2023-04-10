import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {
  //const PageNotFoundScreen({super.key});
  static const routeName = '/page-not-found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Page not found'),
      )),
      body: Center(
          child: Text(
        'Page not found',
        style: Theme.of(context).textTheme.bodyLarge,
      )),
    );
  }
}
