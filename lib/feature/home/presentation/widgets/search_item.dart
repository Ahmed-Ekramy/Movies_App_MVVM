import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/pop_model.dart';

class SearchItems extends StatelessWidget {
  SearchItems(
      this.searchList, {
        super.key,
      });

  Results searchList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: CachedNetworkImage(
            imageUrl: "https://image.tmdb.org/t/p/w500${searchList.posterPath}",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
            const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) =>
                Center(child: const Icon(Icons.error)),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${searchList.title}",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),maxLines: 2,overflow:TextOverflow.ellipsis),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [const Icon(Icons.star,size: 30,color: Colors.yellow,),
                  const SizedBox(width: 20,),
                  Text("${searchList.voteAverage}",style: const TextStyle(fontSize: 20),)],),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("${searchList.releaseDate}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
