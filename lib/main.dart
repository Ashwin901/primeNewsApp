import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prime_news/bloc/state.dart';
import 'package:prime_news/news_screen.dart';
import 'package:prime_news/options.dart';
import 'package:prime_news/welcome_screen.dart';
import 'bloc/news_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return NewsBloc(InitState());
          },
          child: NewsScreen(),
        ),
        BlocProvider(
          create: (context) {
            return NewsBloc(InitState());
          },
          child: Options(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}
