import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/feature/home/data/models/list_model.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_cubit.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_state.dart';
import 'package:movies_app1/feature/home/presentation/widgets/list_item.dart';

import '../../widgets/discover_item.dart';

class BrowseTab extends StatelessWidget {
  Genres? genres;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: DefaultTabController(
                    length: LayoutCubit.get(context).genresList.length,
                    child: TabBar(
                      onTap: (value) {
                        LayoutCubit.get(context).changeSource(value);
                      },
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      tabs: LayoutCubit.get(context)
                          .genresList
                          .map((source) => Tab(
                              child: TabItems(
                                  source,
                                  LayoutCubit.get(context)
                                          .genresList
                                          .indexOf(source) ==
                                      LayoutCubit.get(context).selectedInex)))
                          .toList(),
                    )),
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent &&
                        notification is ScrollUpdateNotification) {
                      LayoutCubit.get(context).getDiscover();
                    }
                    return true;
                  },
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return DiscoverItem(
                          LayoutCubit.get(context).discoverList[index]);
                    },
                    itemCount: LayoutCubit.get(context).discoverList.length,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
