import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/feature/home/data/repositories/homeRepoImp.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_cubit.dart';
import 'package:movies_app1/feature/home/presentation/widgets/new_item.dart';
import '../../manager/layout_state.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(HomeRepoImpl())..getUpComing(),
      child: Scaffold(
        body: BlocBuilder<LayoutCubit, LayoutStates>(
          buildWhen: (previous, current) => current is! PaginationLoadingState&&current is !PaginationFailureState,
          builder: (context, state) {
            if (state is UpComingLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is UpComingFailureState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            else if (state is UpComingSuccessesState) {
              return
                   NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification.metrics.pixels ==
                              notification.metrics.maxScrollExtent &&
                          notification is ScrollUpdateNotification) {
                        LayoutCubit.get(context).getUpComing(fromLoading: true);
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
                          LayoutCubit.get(context).upComingList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: NewItem(
                                LayoutCubit.get(context).upComingList[index]),
                          ),
                        )),
                  );
            }
            else{
              return Center(child: Text("UnHandel"),);
            }
          },
        ),
           bottomNavigationBar: SizedBox(
             height: 60,
             child: BlocBuilder<LayoutCubit, LayoutStates>(
               buildWhen: (previous, current) => current is PaginationLoadingState||current is UpComingSuccessesState||current is PaginationFailureState,
              builder: (context, state) {
                if (state is PaginationLoadingState) {
                  return const SafeArea(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },

      ),
           ),
    ));
  }
}
