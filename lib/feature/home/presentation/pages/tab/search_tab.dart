import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_cubit.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_state.dart';
import '../../widgets/search_item.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                    decoration: const InputDecoration(
                        hintText: 'Enter Movies Search',
                        label: Text('Search'),
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.grey),
                        )),
                    onChanged: (value) {
                      LayoutCubit.get(context).getSearch(name: value);
                    }),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: NotificationListener<ScrollUpdateNotification>(
                    onNotification: (notification) {
                      if (notification.metrics.pixels ==
                              notification.metrics.maxScrollExtent &&
                          notification is ScrollUpdateNotification) {
                         LayoutCubit.get(context).getSearch();
                      }
                      return true;
                    },
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SearchItems(
                                LayoutCubit.get(context).searchList[index]),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                            color: Colors.grey,
                            thickness: 2,
                            endIndent: 40,
                            indent: 40),
                        itemCount: LayoutCubit.get(context).searchList.length),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
