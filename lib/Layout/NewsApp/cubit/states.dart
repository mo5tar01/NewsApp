abstract class NewsStates {}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsGetNewsBusinessSuccessState extends NewsStates{}
class NewsGetNewsBusinessErrorState extends NewsStates{
  final String error;
  NewsGetNewsBusinessErrorState(this.error);
}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetNewsSportsSuccessState extends NewsStates{}
class NewsGetNewsSportsErrorState extends NewsStates{
  final String error;
  NewsGetNewsSportsErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetNewsScienceSuccessState extends NewsStates{}
class NewsGetNewsScienceErrorState extends NewsStates{
  final String error;
  NewsGetNewsScienceErrorState(this.error);
}
class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetNewsSearchSuccessState extends NewsStates{}
class NewsGetNewsSearchErrorState extends NewsStates{
  final String error;
  NewsGetNewsSearchErrorState(this.error);
}
class NewsGetSearchLoadingState extends NewsStates{}


