import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/feature/home/data/models/discover_model.dart';
import 'package:movies_app1/feature/home/data/models/list_model.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_cubit.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_state.dart';
import 'package:movies_app1/feature/home/presentation/widgets/list_item.dart';

class BrowseTab extends StatelessWidget {
  Genres? genres;



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
                    length: LayoutCubit
                        .get(context)
                        .genresList
                        .length,
                    child: TabBar(
                      onTap: (value) {
                        LayoutCubit.get(context).
                        getDiscover(genresId:LayoutCubit.get(context).genresList[value].id);
                        LayoutCubit.get(context).changeSource(value);
                      },
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      tabs: LayoutCubit
                          .get(context)
                          .genresList
                          .map((source) =>
                          Tab(
                              child: TabItems(source,
                                  LayoutCubit
                                      .get(context)
                                      .genresList
                                      .indexOf(source) == LayoutCubit
                                      .get(context)
                                      .selectedInex)))
                          .toList(),
                    )),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                   return DiscoverItem(LayoutCubit
                        .get(context)
                        .discoverList[index]);
                  }, itemCount: LayoutCubit
                    .get(context)
                    .discoverList
                    .length,),
              )

            ],
          ),
        );
      },
    );
  }


}

class DiscoverItem extends StatelessWidget {
  DiscoverItem(this.discoverList, {super.key});

  ResultsDiscover discoverList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context,DetailsScreen.routeName,arguments: discoverList);
      },
      child: Card(
        margin: EdgeInsets.all(14),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.transparent)),
        elevation: 16,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                imageUrl: "https://image.tmdb.org/t/p/w500${discoverList.backdropPath}",
                height: 200,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Text(
                discoverList.title ?? "",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 10,),
              Text(
                discoverList.title ?? "",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Text(
                discoverList.overview ?? "",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 14,),
              Text(discoverList.releaseDate!.substring(0, 10),
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

