import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univ_finder_app/blocs/article/article_bloc.dart';
import 'package:univ_finder_app/blocs/article/article_event.dart';
import 'package:univ_finder_app/blocs/university/university_bloc.dart';
import 'package:univ_finder_app/repositories/api_repository.dart';
import 'package:univ_finder_app/utils/pages_navigator.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => UniversityBloc(ApiRepository())),
    BlocProvider(create: (context) => ArticleBloc()..add(LoadArticleItems())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PagesNavigator(),
    );
  }
}
