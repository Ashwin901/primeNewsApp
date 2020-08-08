import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prime_news/bloc/state.dart';
import 'news_screen.dart';
import 'package:prime_news/components/options.dart';
import 'welcome_screen.dart';
import 'bloc/news_bloc.dart';
import 'package:prime_news/theme/themeOptions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NewsBloc newsBloc;
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
      child : BlocBuilder<NewsBloc, NewsState>(
        builder: (context , NewsState state){
          var theme = lightTheme;
          if(state is ChangeThemeState){
            theme = state.theme;
          }
          return MaterialApp(
            theme:theme ,
            debugShowCheckedModeBanner: false,
            home: WelcomeScreen(),
          );
        },
      )
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    newsBloc.close();
    super.dispose();
  }

}