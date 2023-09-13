abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsChangeBottomNavigationState extends NewsStates {}

class NewGetBusinessSuccessState extends NewsStates {}

class NewLoadingGetBusinessSuccessState extends NewsStates {}

class NewGetBusinessErrorState extends NewsStates {
  final String error;

  NewGetBusinessErrorState(this.error);
}

class NewGetSportsSuccessState extends NewsStates {}

class NewLoadingGetSportsSuccessState extends NewsStates {}

class NewGetSportsErrorState extends NewsStates {
  final String error;

  NewGetSportsErrorState(this.error);
}

class NewGetScienceSuccessState extends NewsStates {}

class NewLoadingGetScienceSuccessState extends NewsStates {}

class NewGetScienceErrorState extends NewsStates {
  final String error;

  NewGetScienceErrorState(this.error);
}

class NewGetSearchSuccessState extends NewsStates {}

class NewLoadingGetSearchSuccessState extends NewsStates {}

class NewGetSearchErrorState extends NewsStates {
  final String error;

  NewGetSearchErrorState(this.error);
}
