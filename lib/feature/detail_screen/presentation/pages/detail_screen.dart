import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/feature/detail_screen/data/models/simillar_model.dart';
import 'package:movies_app1/feature/detail_screen/data/repositories/detail_rpo_imp.dart';
import 'package:movies_app1/feature/detail_screen/presentation/manager/detail_cubit.dart';
import 'package:movies_app1/feature/detail_screen/presentation/manager/detail_state.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.id, {super.key});

  int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            DetailCubit(DetailRpoImp())..getDetail(id: id ?? 0)..getSimilar(id:id ??0),
        child: BlocConsumer<DetailCubit, DetailStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl:
                                "https://image.tmdb.org/t/p/w500${DetailCubit.get(context).detailModel?.backdropPath}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Text(
                          "${DetailCubit.get(context).detailModel?.title}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: [
                            const SizedBox(),
                            const Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${DetailCubit.get(context).detailModel?.voteAverage}",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const Spacer(),
                            Text(
                              "${DetailCubit.get(context).detailModel?.releaseDate}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                            itemCount: DetailCubit.get(context)
                                .detailModel
                                ?.genres
                                ?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 100,
                                decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Center(
                                  child: Text(
                                    "${DetailCubit.get(context).detailModel?.genres?[index].name}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${DetailCubit.get(context).detailModel?.overview}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Related Movies",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => SimilarItem(DetailCubit.get(context).similarList[index]),
                          itemCount: DetailCubit.get(context).similarList.length,),
                        )

                      ]),
                ),
              ),
            );
          },
        ));
  }
}
class SimilarItem extends StatelessWidget {
  SimilarItem(this. similarList, {super.key});

  ResultsSimilar similarList;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Card(
          elevation: 0,
          borderOnForeground: true,
          color: const Color(0xFF15141F),
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0x4DDADADA),
                border: Border.all(
                  color: const Color(0x40FFFFFF),
                ),
                borderRadius:
                const BorderRadius.horizontal(
                    left: Radius.circular(20),
                    right:
                    Radius.circular(20))),
            width: 220,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: 250,
                          width: double.infinity,
                          child:   CachedNetworkImage(
                            imageUrl:
                            "https://image.tmdb.org/t/p/w500${similarList.posterPath}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),),
                        Positioned(
                          top:-10,
                          right: 5,
                          child:  IconButton(onPressed: () {  }, icon: const Icon(Icons.bookmark_add,size: 50,),),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [const Icon(Icons.star,size: 30,color: Colors.yellow,),
                        const SizedBox(width: 20,),
                        Text("${similarList.voteAverage}",style: const TextStyle(fontSize: 20),)],),
                    const SizedBox(height: 10,),
                    Text("${similarList.title}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("${similarList.releaseDate}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey)),
                      ],
                    ),

                  ]),
            ),),
        )
    );
  }
}