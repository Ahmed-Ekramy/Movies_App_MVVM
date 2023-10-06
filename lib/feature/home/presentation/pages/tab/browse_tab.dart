import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/feature/home/data/models/list_model.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_cubit.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_state.dart';
import 'package:movies_app1/feature/home/presentation/widgets/list_item.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
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
                      tabs:LayoutCubit.get(context). genresList
                          .map((source) =>
                          Tab(
                              child: TabItems(source,
                                  LayoutCubit.get(context).genresList.indexOf(source) == LayoutCubit
                                      .get(context)
                                      .selectedInex)))
                          .toList(),
                    )),
              ),

            ],
          ),
        );
      },
    );
  }


}

