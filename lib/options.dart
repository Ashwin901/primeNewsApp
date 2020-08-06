import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prime_news/bloc/event.dart';
import 'package:prime_news/bloc/news_bloc.dart';
import 'constants.dart';

class Options extends StatefulWidget {

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  NewsBloc newsBloc;

  @override
  Widget build(BuildContext context) {
    newsBloc = BlocProvider.of(context);
    return Padding(
      padding: EdgeInsets.only(top:15.0,left: 38.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: FlatButton(
              child: Text("sports",
                  style: screenStyle,
              ),
              color: Color(0xff7fdbda),
            onPressed: (){
              newsBloc.add(SportsNewsEvent(sportsUrl: "https://content.guardianapis.com/search?api-key=9414bc67-5ab4-4a19-93c0-8760a0b643a4&q=sports"));
            },
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          SizedBox(
            height: 50.0,
            child: FlatButton(
              child: Text("politics",
                style: screenStyle,
              ),
              color: Color(0xffade498),
            onPressed: (){
              newsBloc.add(PoliticsEvent());
            },
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          SizedBox(
            height: 50,
            child: FlatButton(
              child: Text("science",
                style: screenStyle,
              ),
              color: Color(0xffede682),
            onPressed: (){
                newsBloc.add(ScienceEvent());
            },
            ),
          )
        ],
      ),
    );
  }
@override
  void dispose() {
    // TODO: implement dispose
  newsBloc.close();
  super.dispose();
  }
}