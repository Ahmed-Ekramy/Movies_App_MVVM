import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_cubit.dart';
import 'package:movies_app1/feature/home/presentation/manager/layout_state.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(

            body: LayoutCubit.get(context)
                .tabs[LayoutCubit.get(context).currentIndex],
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0x4DDADADA),
                  border: Border.all(
                    color: Color(0x40FFFFFF),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  // تدوير الزوايا
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 3), // تحديد الظل
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                    elevation: 0,
                    selectedIconTheme: const IconThemeData(
                        color: Colors.deepOrangeAccent, size: 35),
                    unselectedIconTheme:
                        const IconThemeData(color: Colors.white, size: 30),
                    onTap: (value) {
                      LayoutCubit.get(context).changeNav(value);
                    },
                    currentIndex: LayoutCubit.get(context).currentIndex,
                    items: const [
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Icon(Icons.home_filled, size: 44),
                          label: ""),
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Icon(
                            Icons.search_rounded,
                            size: 44,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Icon(
                            Icons.browser_updated,
                            size: 44,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Icon(
                            Icons.bookmark_added,
                            size: 44,
                          ),
                          label: ""),
                    ]),
              ),
            ),
          );
        },
      );
  }
}
