import 'package:bloc/bloc.dart';
import 'package:prime_news/bloc/event.dart';
import 'package:prime_news/bloc/state.dart';
import 'package:prime_news/getNews.dart';

class NewsBloc extends Bloc<NewsEvent,NewsState>{
  NewsBloc(NewsState initialState) : super(initialState);

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async*{
   if(event is SportsNewsEvent){
     var sportsUrl = "https://content.guardianapis.com/search?api-key=9414bc67-5ab4-4a19-93c0-8760a0b643a4&q=sports";
    var sportsData = await GetNews().getData(sportsUrl);
    yield SportsNewsState(sportsNews: sportsData, newsTitle: "sports");
   } else if(event is PoliticsEvent){
     var politicsUrl = "https://content.guardianapis.com/search?api-key=9414bc67-5ab4-4a19-93c0-8760a0b643a4&section=politics";
     var politicsData = await GetNews().getData(politicsUrl);
     yield PoliticsState(politicsData: politicsData,newsTitle: "Politics");
   }else if(event is ScienceEvent){
     var scienceUrl = "https://content.guardianapis.com/search?api-key=9414bc67-5ab4-4a19-93c0-8760a0b643a4&section=science";
     var scienceData = await GetNews().getData(scienceUrl);
     yield ScienceState(scienceData: scienceData, newsTitle: "Science");
   }else if(event is TrendingNewsEvent){
     var url = "https://content.guardianapis.com/search?api-key=9414bc67-5ab4-4a19-93c0-8760a0b643a4";
     var trendingData = await GetNews().getData(url);
     yield TrendingState(newsTitle: "Trending", trendingNews: trendingData);
   }else if(event is ProgressIndicatorEvent){
     yield ProgressIndicatorState();
   }
  }

}