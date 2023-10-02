
import 'package:movies_app1/feature/home/data/models/pop_model.dart';

import '../../data/models/top_rated.dart';
import '../../data/models/upcoming_model.dart';

abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}
class ChangeNavState extends LayoutStates {}

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
class TopRatedSuccessesState extends LayoutStates {
  TopRatedSuccessesState(this.topRatedModel);
  TopRatedModel topRatedModel;
}
class TopRatedFailureState extends LayoutStates {
  final String errorMessage;
  TopRatedFailureState(this.errorMessage);
}