import 'package:flutter/material.dart';
import 'file:///C:/Users/Ashwin%20P/AndroidStudioProjects/prime_news/lib/components/constants.dart';
import 'file:///C:/Users/Ashwin%20P/AndroidStudioProjects/prime_news/lib/data/getNews.dart';
import 'news_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  GetNews _getNews ;

  void sendData() async{
    var newsData = await _getNews.getData("https://content.guardianapis.com/search?api-key=9414bc67-5ab4-4a19-93c0-8760a0b643a4");
    Navigator.push(context, MaterialPageRoute(
      builder: (context){
        return NewsScreen(newsData: newsData, newsTitle: "Trending",);
      }
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    _getNews = GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Color(0xff96deda ),
          ]
        )
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "prime news",
              style: screenStyle.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 25.0,
              ),
            ),
            FlatButton(
              color:Color(0xff6ebfb5),
              child: Text(
                "Get started",
                style: screenStyle
              ),
              onPressed: () {
                sendData();
              },
            )
          ],
        )),
      ),
    );
  }
}
