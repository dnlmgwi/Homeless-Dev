import 'package:flutter/material.dart';
import 'package:test_app/screens/home/home.dart';
import 'package:test_app/screens/login/login.dart';

final routes = {
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new HomeScreen(),
  '/': (BuildContext context) => new LoginScreen(),
};
