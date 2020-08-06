import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prime_news/bloc/event.dart';
import 'package:prime_news/bloc/news_bloc.dart';
import 'bloc/state.dart';
import 'constants.dart';
import 'options.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  final newsData,newsTitle;
  NewsScreen({this.newsData,this.newsTitle});
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsBloc newsBloc;
  var newsData;
  var newsTitle;
  @override
  void initState() {
    newsData = widget.newsData;
    newsTitle = widget.newsTitle;
    super.initState();
  }

  void launchUrl(String newsUrl) async{
    String url =  newsUrl;
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    newsBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[Icon(Icons.account_circle)],
        leading: IconButton(
          icon:Icon(Icons.arrow_back,
            color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("prime news", style: screenStyle),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, NewsState state) {
          if(state is SportsNewsState){
            newsData = state.sportsNews;
            newsTitle = state.newsTitle;
          }else if(state is PoliticsState){
            newsData = state.politicsData;
            newsTitle = state.newsTitle;
          }else if(state is ScienceState){
            newsData = state.scienceData;
            newsTitle = state.newsTitle;
          }else if(state is TrendingState){
            newsData = state.trendingNews;
            newsTitle = state.newsTitle;
          }
          return RefreshIndicator(
            onRefresh: () async{
              newsBloc.add(TrendingNewsEvent());
              await Future.delayed(Duration(seconds: 3));
            },
            color: Color(0xffade498),
            child: Column(
              children: <Widget>[
                Options(),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(newsTitle,
                      style: screenStyle,
                      ),
                      Icon(
                        Icons.trending_up
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.white,
                        Color(0xff96deda),
                      ]),
                      color: Color(0xffade498),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25)),
                    ),
                    child:Padding(
                        padding: EdgeInsets.only(top:12),
                        child: ListView.builder(itemCount: newsData["response"]["results"].length,itemBuilder: (context, index){
                          return Card(
                            child: ExpansionTile(
                              title: Text(newsData["response"]["results"][index]["webTitle"],
                              style: screenStyle
                              ) ,
                           children: <Widget>[
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 Text("comments",
                                 style: screenStyle,
                                 ),
                                 IconButton(
                                   icon: Icon(Icons.launch),
                                   onPressed: (){
                                     launchUrl(newsData["response"]["results"][index]["webUrl"]);
                                   },
                                 )
                               ],
                             )
                           ],
                            ),
                          );
                        }),
                      ),
                  ),
                )
              ],
            ),
          );
        },
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
