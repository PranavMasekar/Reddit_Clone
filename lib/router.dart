import 'package:flutter/material.dart';
import 'package:reddit_clone/modules/auth/screens/login.dart';
import 'package:reddit_clone/modules/community/screens/community_screen.dart';
import 'package:reddit_clone/modules/community/screens/create_community.dart';
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
    "/create-community": (_) => MaterialPage(child: CreateCommunity()),
    "/r/:name": (route) => MaterialPage(
          child: CommunityScreen(name: route.pathParameters["name"]!),
        ),
  },
);
