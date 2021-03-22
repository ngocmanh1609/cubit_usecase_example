import 'package:bloc_usecase_example/screen/detail/github_detail_screen.dart';
import 'package:bloc_usecase_example/screen/home/home_screen.dart';
import 'package:bloc_usecase_example/screen/overview/github_overview_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String firstScreen = "/";
  static const String githubOverview = "/github-overview";
  static const String githubRepositoryDetail = "/github-repository-detail";

  static final routes = <String, WidgetBuilder>{
    firstScreen: (BuildContext context) => HomeScreen(),
    githubOverview: (BuildContext context) =>
        GithubOverviewScreen.create(context),
    githubRepositoryDetail: (BuildContext context) =>
        GithubDetailScreen.create(context),
  };
}
