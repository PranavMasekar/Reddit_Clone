import 'package:flutter/material.dart';
import 'package:reddit_clone/modules/auth/screens/login.dart';
import 'package:reddit_clone/modules/home/screen/home.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(
  routes: {
    "/": (route) => MaterialPage(child: LoginScreen()),
  },
);
final loggedInRoute = RouteMap(
  routes: {
    "/": (route) => MaterialPage(child: HomePage()),
  },
);
