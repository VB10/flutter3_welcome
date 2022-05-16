import 'package:flutter/material.dart';

enum Water {
  frozen(32),
  lukewarm(100),
  boiling(212);

  final int tempInFahrenheit;
  const Water(this.tempInFahrenheit);

  String path(String id) {
    return tempInFahrenheit.toString() + id;
  }

  @override
  String toString() => "The $name water is $tempInFahrenheit F.";
}

class NewEnumView extends StatefulWidget {
  const NewEnumView({Key? key}) : super(key: key);

  @override
  State<NewEnumView> createState() => _NewEnumViewState();
}

class _NewEnumViewState extends State<NewEnumView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(ServicePath.login.withBaseUrl());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

enum Numbers { one, two }

enum ServicePath {
  users('api/users?page=2'),
  login('/api/login');

  final String path;
  const ServicePath(this.path);

  String withBaseUrl() {
    return 'https://reqres.in/$path';
  }
}
