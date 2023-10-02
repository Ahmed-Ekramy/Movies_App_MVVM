import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/feature/detail_screen/presentation/pages/detail_screen.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_cubit.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_state.dart';
import '../../../../../routes/routes.dart';
import '../../widgets/new_item.dart';
import '../../widgets/top_rated_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   LayoutCubit.get(context).getPop();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 30),
                  child: Row(
                    children: [
                      Text("Stream",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.deepOrange,
                            letterSpacing: 0.48,
                          )),
                      Text(" Everywhere",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: 0.48,
                          )),
                    ],
                  ),
                ),
                CarouselSlider(
                    disableGesture: true,
                    items: LayoutCubit.get(context)
                        .popList
                        ?.map(
                          (e) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      "https://image.tmdb.org/t/p/w500${e.backdropPath}",
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: 226,
                                      height: 66,
                                      decoration: BoxDecoration(
                                          color: const Color(0x4DDADADA),
                                          border: Border.all(
                                            color: const Color(0x40FFFFFF),
                                          ),
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  left: Radius.circular(20),
                                                  right: Radius.circular(20))),
                                      child: Text(
                                        "${e.title}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFFFFFF),
                                          letterSpacing: 0.32,
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      height: 200,
                      aspectRatio: 20 / 5,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.linear,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.1,
                      scrollDirection: Axis.horizontal,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("New Releases",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.48,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.newScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: 25,
                          width: 80,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                            child: Text(" See All",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.48,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) {
                          return DetailScreen(LayoutCubit.get(context)
                              .upComingList[index]
                              .id);
                          },));
                        },
                        child: NewItem(
                            LayoutCubit.get(context).upComingList[index])),
                    itemCount: LayoutCubit.get(context).upComingList.length,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(" Top Rated",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.48,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.topRated);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: 25,
                          width: 80,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                            child: Text(" See All",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.48,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DetailScreen(LayoutCubit.get(context)
                              .topRatedList[index]
                              .id);
                        },));
                      },
                      child: TopRatedItem(
                          LayoutCubit.get(context).topRatedList[index]),
                    ),
                    itemCount: LayoutCubit.get(context).topRatedList.length,
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
