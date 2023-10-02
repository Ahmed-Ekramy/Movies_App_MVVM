import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/feature/home/data/models/top_rated.dart';
import 'package:movies_app1/feature/home/presentation/pages/tab/browse_tab.dart';
import 'package:movies_app1/feature/home/presentation/pages/tab/home_tab.dart';
import 'package:movies_app1/feature/home/presentation/pages/tab/search_tab.dart';
import 'package:movies_app1/feature/home/presentation/pages/tab/watch_list.dart';

import '../../data/models/upcoming_model.dart';
import '../../data/models/pop_model.dart';
import '../../data/repositories/homeRepoImp.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit(this.homeRepoImpl) : super((LayoutInitialState()));
  HomeRepoImpl homeRepoImpl;

  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Results> popList = [];
  List<ResultsUpComing> upComingList = [];
  List<ResultsTopRated> topRatedList = [];


  void changeNav(value) {
    currentIndex = value;
    emit(ChangeNavState());
  }

  List<Widget> tabs = const [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab()
  ];
  void getPop() async {
    emit(PopularLoadingState());
    var result = await homeRepoImpl.getPop();
    result.fold((l) => emit(PopularFailureState(l.message)), (r) {
      popList = r.results!;
      emit(PopularSuccessesState(r));
    });
  }
  void getUpComing() async {
    emit(PopularLoadingState());
    var result = await homeRepoImpl.getUpComing();
    result.fold((l) => emit(UpComingFailureState(l.message)),
        (r) {
          upComingList=r.results??[];
          emit(UpComingSuccessesState(r));
        });
  }
  void topRated() async {
    emit(PopularLoadingState());
    var result = await homeRepoImpl.getTopRated();
    result.fold((l) => emit(TopRatedFailureState(l.message)),
        (r) {
          topRatedList=r.results??[];
          emit(TopRatedSuccessesState(r));
        });
  }
}
