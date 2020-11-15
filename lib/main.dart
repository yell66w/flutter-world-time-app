import 'package:flutter/material.dart';
import 'package:world_time_app_with_netninja/pages/choose_location.dart';
import 'package:world_time_app_with_netninja/pages/home.dart';
import 'package:world_time_app_with_netninja/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
    ));
