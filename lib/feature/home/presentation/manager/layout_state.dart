import 'package:movies_app1/feature/home/data/models/pop_model.dart';

import '../../data/models/list_model.dart';
import '../../data/models/top_rated.dart';
import '../../data/models/upcoming_model.dart';

abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class ChangeNavState extends LayoutStates {}

//////////////////////////
/////////////////////////////
class PaginationLoadingState extends LayoutStates {}

class PaginationFailureState extends LayoutStates {
  final String errorMessage;

  PaginationFailureState(this.errorMessage);
}
///////////////////////////////
/////////////////////////////////////

class PopularLoadingState extends LayoutStates {}

class PopularSuccessesState extends LayoutStates {
  PopularSuccessesState(this.popularModel);

  PopularModel popularModel;
}

class PopularFailureState extends LayoutStates {
  final String errorMessage;

  PopularFailureState(this.errorMessage);
}

//////////////////////////////////////
/////////////////////////////////////

class UpComingLoadingState extends LayoutStates {}

class UpComingSuccessesState extends LayoutStates {
  UpComingSuccessesState(this.upComingModel);

  UpComingModel upComingModel;
}

class UpComingFailureState extends LayoutStates {
  final String errorMessage;

  UpComingFailureState(this.errorMessage);
}

//////////////////////////////////////
/////////////////////////////////////
class TopRatedLoadingState extends LayoutStates {}
class HomeChangeSource extends LayoutStates {}

class TopRatedSuccessesState extends LayoutStates {
  TopRatedSuccessesState(this.topRatedModel);

  TopRatedModel topRatedModel;
}

class TopRatedFailureState extends LayoutStates {
  final String errorMessage;

  TopRatedFailureState(this.errorMessage);
}

//////////////////////////////////////
/////////////////////////////////////
class SearchLoadingState extends LayoutStates {}

class SearchSuccessesState extends LayoutStates {
  SearchSuccessesState(this.popularModel);

  PopularModel popularModel;
}

class SearchFailureState extends LayoutStates {
  final String errorMessage;

  SearchFailureState(this.errorMessage);
}

////////////////////////////////////
/////////////////////////////////////
class GenresLoadingState extends LayoutStates {}

class GenresSuccessesState extends LayoutStates {
  GenresSuccessesState(this.listModel);

  ListModel listModel;
}

class GenresFailureState extends LayoutStates {
  final String errorMessage;

  GenresFailureState(this.errorMessage);
}
