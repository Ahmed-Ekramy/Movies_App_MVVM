import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:movies_app1/core/failure.dart';
import 'package:movies_app1/feature/home/data/models/top_rated.dart';
import 'package:movies_app1/feature/home/data/models/upcoming_model.dart';

import 'package:movies_app1/feature/home/data/models/pop_model.dart';

import '../../../../core/constants.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failures, PopularModel>> getPop() async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
          "$baseUrl/popular?$apiKey");
      PopularModel popularModel = PopularModel.fromJson(response.data);
      return right(popularModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failures, PopularModel>> getSearch({required String name, int? numPage}) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(

          "https://api.themoviedb.org/3/search/movie?$apiKey&query=$name&page=${numPage??0}");
      PopularModel popularModel = PopularModel.fromJson(response.data);
      print(popularModel.results?[1].title);
      return right(popularModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UpComingModel>> getUpComing( {required  int numPage}) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
          "$baseUrl/upcoming?$apiKey&page=$numPage");
      UpComingModel upComingModel=UpComingModel.fromJson(response.data);
      return Right(upComingModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }

    }

  @override
  Future<Either<Failures, TopRatedModel>> getTopRated({required  int numPage}) async{
    Dio dio = Dio();

    try {
    var response=await dio.get(  "$baseUrl/top_rated?$apiKey&page=$numPage");
    TopRatedModel topRatedModel= TopRatedModel.fromJson(response.data);
    return Right(topRatedModel);
  }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
 }
  }

