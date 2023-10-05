import 'package:dartz/dartz.dart';
import 'package:movies_app1/core/failure.dart';
import 'package:movies_app1/feature/home/data/models/upcoming_model.dart';
import 'package:movies_app1/feature/home/data/models/pop_model.dart';

import '../../../detail_screen/data/models/detail_model.dart';
import '../models/top_rated.dart';

abstract class HomeRepo{
Future<Either<Failures,PopularModel>> getPop();
Future<Either<Failures,PopularModel>> getSearch({required String name,required  int numPage});
Future<Either<Failures,UpComingModel>> getUpComing({required  int numPage});
Future<Either<Failures,TopRatedModel>> getTopRated({required  int numPage});

}