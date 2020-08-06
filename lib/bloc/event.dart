class NewsEvent{}

class GetInitialNewsEvent extends NewsEvent{}

class SportsNewsEvent extends NewsEvent{
  final sportsUrl;
  SportsNewsEvent({this.sportsUrl});
}

class TrendingNewsEvent extends NewsEvent{}

class PoliticsEvent extends NewsEvent{}

class ScienceEvent extends NewsEvent{}