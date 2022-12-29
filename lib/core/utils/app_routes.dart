import 'package:flutter/material.dart';
import 'package:new_app/features/news_feature/presentation/screens/search_screen/search_screen.dart';
import 'package:new_app/features/news_feature/presentation/screens/news_layout/new_layout.dart';

class AppRoutes {
  static String newsMainScreen = 'root';
  static String newsSearchScreen = 'searchScreen';
}

final appRoutesMap = {
  AppRoutes.newsMainScreen: (context) => const NewsLayout(),
  AppRoutes.newsSearchScreen: (context) => SearchScreen(),
};
