

class NewsState{}

class InitState extends NewsState{}


class SportsNewsState extends NewsState{
  final sportsNews, newsTitle;
  SportsNewsState({this.sportsNews, this.newsTitle});
}

class PoliticsState extends NewsState{
  final politicsData , newsTitle;
  PoliticsState({this.politicsData,this.newsTitle});
}

class ScienceState extends NewsState{
  final scienceData, newsTitle;
  ScienceState({this.scienceData, this.newsTitle});
}

class TrendingState extends NewsState{
  final trendingNews, newsTitle;
  TrendingState({this.trendingNews, this.newsTitle});
}

class ProgressIndicatorState extends NewsState{}

class ChangeThemeState extends NewsState{
  final theme;
  ChangeThemeState({this.theme});
}


