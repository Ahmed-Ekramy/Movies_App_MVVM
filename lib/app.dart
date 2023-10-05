import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/routes/routes.dart';

import 'feature/home/data/repositories/homeRepoImp.dart';
import 'feature/home/presentation/manager/layout_cubit.dart';

class Movies extends StatelessWidget {
  String? value ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit(HomeRepoImpl())
            ..getPop()
            ..getUpComing()
            ..topRated(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: const Color(0xFF15141F)),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: (settings) => AppRoutes.onGenrate(settings),
      ),
    );
  }

}
