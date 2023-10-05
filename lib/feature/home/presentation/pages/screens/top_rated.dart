import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/feature/detail_screen/presentation/pages/detail_screen.dart';

import '../../../data/repositories/homeRepoImp.dart';
import '../../manager/layout_cubit.dart';
import '../../manager/layout_state.dart';
import '../../widgets/top_rated_item.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(HomeRepoImpl())..topRated(),
      child: Scaffold(
        body: BlocBuilder<LayoutCubit, LayoutStates>(
          //  buildWhen: (previous, current) => current is! PaginationLoadingState&&current is !PaginationFailureState,
          builder: (context, state) {
            return NotificationListener<ScrollUpdateNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent) {
                  LayoutCubit.get(context).topRated(fromLoading: true);
                }
                return true;
              },
              child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 0,
                  childAspectRatio: 1.1 / 2.3,
                  children: List.generate(
                    LayoutCubit.get(context).topRatedList.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailScreen(LayoutCubit.get(context)
                                    .topRatedList[index].id);
                              },
                            ));
                          },
                          child: TopRatedItem(
                              LayoutCubit.get(context).topRatedList[index])),
                    ),
                  )),
            );
          },
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BlocBuilder<LayoutCubit, LayoutStates>(
            //   buildWhen: (previous, current) => current is PaginationLoadingState||current is TopRatedSuccessesState||current is PaginationFailureState,
            builder: (context, state) {
              if (state is PaginationLoadingState) {
                return const SafeArea(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is PaginationFailureState) {
                return Text(state.errorMessage);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
