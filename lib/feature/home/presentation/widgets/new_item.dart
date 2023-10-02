import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/upcoming_model.dart';

class NewItem extends StatelessWidget {
  NewItem(this. upComingList, {super.key} );

  ResultsUpComing upComingList;
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
                            "https://image.tmdb.org/t/p/w500${upComingList.posterPath}",
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
                        Text("${upComingList.voteAverage}",style: const TextStyle(fontSize: 20),)],),
                    const SizedBox(height: 10,),
                    Text("${upComingList.title}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("${upComingList.releaseDate}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey)),
                      ],
                    ),

                  ]),
            ),),
        )
    );
  }
}