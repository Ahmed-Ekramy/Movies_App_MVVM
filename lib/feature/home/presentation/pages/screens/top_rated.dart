import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/homeRepoImp.dart';
import '../../manager/layout_cubit.dart';
import '../../manager/layout_state.dart';
import '../../widgets/top_rated_item.dart';

class TopRated extends StatelessWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) =>
      LayoutCubit(HomeRepoImpl())
        ..topRated(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: GridView
                .count(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 0,
                childAspectRatio: 1.1 / 2.3,
                children: List.generate(LayoutCubit.get(context)
                    .topRatedList
                    .length, (index)
                =>Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                  child:TopRatedItem( LayoutCubit.get(context).topRatedList[index]),
                ),
                )

            )
            ,
          );
        },
      ),
    );
  }
}
