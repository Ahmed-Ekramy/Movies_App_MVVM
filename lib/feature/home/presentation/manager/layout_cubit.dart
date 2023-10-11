import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/feature/home/data/models/list_model.dart';
import 'package:movies_app1/feature/home/data/models/top_rated.dart';
import 'package:movies_app1/feature/home/presentation/pages/tab/browse_tab.dart';
import 'package:movies_app1/feature/home/presentation/pages/tab/home_tab.dart';
import 'package:movies_app1/feature/home/presentation/pages/tab/search_tab.dart';
import 'package:movies_app1/feature/home/presentation/pages/tab/watch_list.dart';

import '../../data/models/discover_model.dart';
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
  List<Results> searchList = [];
  List<ResultsUpComing> upComingList = [];
  List<ResultsTopRated> topRatedList = [];
  List<Genres> genresList = [];
  List<ResultsDiscover> discoverList = [];
  int numPage = 1;
  int selectedInex = 0;

  void changeNav(value) {
    currentIndex = value;
    emit(ChangeNavState());
  }

  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    BrowseTab(),
    const WatchListTab()
  ];
  late ScrollController scrollController;

  void getPop() async {
    emit(PopularLoadingState());
    var result = await homeRepoImpl.getPop();
    result.fold((l) => emit(PopularFailureState(l.message)), (r) {
      popList = r.results!;
      emit(PopularSuccessesState(r));
    });
  }

  void getSearch({String? name}) async {
    emit(SearchLoadingState());

    var result =
        await homeRepoImpl.getSearch(name: name ?? "", numPage: numPage);
    result.fold((l) {
      emit(SearchFailureState(l.message));
    }, (r) {
      searchList = r.results!;
      emit(SearchSuccessesState(r));
    });
  }

  void getUpComing({bool fromLoading = false}) async {
    if (fromLoading) {
      emit(PaginationLoadingState());
    } else {
      emit(UpComingLoadingState());
    }
    var result = await homeRepoImpl.getUpComing(numPage: numPage);
    result.fold((l) {
      if (fromLoading) {
        emit(PaginationFailureState(l.message));
      } else {
        emit(UpComingFailureState(l.message));
      }
    }, (r) {
      if (r.results!.isNotEmpty) {
        numPage++;
        upComingList.addAll(r.results ?? []);
        emit(UpComingSuccessesState(r));
      }
    });
  }

  void topRated({bool fromLoading = false}) async {
    if (fromLoading) {
      emit(PaginationLoadingState());
    } else {
      emit(TopRatedLoadingState());
    }
    var result = await homeRepoImpl.getTopRated(numPage: numPage);
    result.fold((l) => emit(TopRatedFailureState(l.message)), (r) {
      if (r.results!.isNotEmpty) {
        numPage++;
        topRatedList.addAll(r.results ?? []);
        emit(TopRatedSuccessesState(r));
      }
    });
  }

  void changeSource(int index) {
    selectedInex = index;
    emit(HomeChangeSource());
  }

  void getGenreList() async {
    emit(GenresLoadingState());
    var result = await homeRepoImpl.getGenreList(numPage: numPage);
    result.fold((l) => emit(GenresFailureState(l.message)), (r) {
      genresList = r.genres ?? [];
      emit(GenresSuccessesState(r));
    });
  }

  void getDiscover() async {
    emit(DiscoverLoadingState());
    var result = await homeRepoImpl.getDiscover(
        numPage: numPage, genresId: genresList[selectedInex].id??0);
    result.fold((l) => emit(DiscoverFailureState(l.message)), (r) {
      if (r.results!.isNotEmpty) {
      numPage++;
      discoverList=(r.results!);
      emit(DiscoverSuccessesState(r));
      }
    });
  }
}
