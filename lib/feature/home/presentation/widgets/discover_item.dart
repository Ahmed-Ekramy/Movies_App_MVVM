import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/discover_model.dart';

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
        margin: const EdgeInsets.all(14),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent)),
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
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Text(
                discoverList.title ?? "",
                style: const TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,),
              Text(
                discoverList.overview ?? "",
                style: const TextStyle(fontSize: 25, color: Colors.black),
              ),
              const SizedBox(height: 14,),
              Text(discoverList.releaseDate!.substring(0, 10),
                textAlign: TextAlign.end,
                style: const TextStyle(
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