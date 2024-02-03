abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBussinessErrorStata extends NewsStates {
  final String error;
  NewsGetBussinessErrorStata(this.error);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorStata extends NewsStates {
  final String error;
  NewsGetSportsErrorStata(this.error);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorStata extends NewsStates {
  final String error;
  NewsGetScienceErrorStata(this.error);
}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorStata extends NewsStates {
  final String error;
  NewsGetSearchErrorStata(this.error);
}

/*class NewsAppChangeModeState extends NewsStates {}*/
