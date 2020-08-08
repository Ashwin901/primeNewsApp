class NewsEvent{}

class GetInitialNewsEvent extends NewsEvent{}

class ProgressIndicatorEvent extends NewsEvent{}

class SportsNewsEvent extends NewsEvent{}

class TrendingNewsEvent extends NewsEvent{}

class PoliticsEvent extends NewsEvent{}

class ScienceEvent extends NewsEvent{}

class ChangeThemeEvent extends NewsEvent{
  final theme;
  ChangeThemeEvent({this.theme});
}

