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
    return Container(
      decoration: BoxDecoration(
          color: const Color(0x4DDADADA),
          border: Border.all(
            color: const Color(0x40FFFFFF),
          ),
          borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(20), right: Radius.circular(20))),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          SizedBox(
            height: 250,
            width: 200,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  "https://image.tmdb.org/t/p/w500${searchList.posterPath}",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) =>
                  Center(child: const Icon(Icons.error)),
            ),
          ),
          SizedBox(width:10 ,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${searchList.title}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                          "${searchList.overview}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          maxLines: 3,overflow:TextOverflow.ellipsis
                      ),
                    ),


                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 30,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${searchList.voteAverage}",
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
