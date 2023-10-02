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
  Future<Either<Failures, UpComingModel>> getUpComing() async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
          "$baseUrl/upcoming?$apiKey");
      UpComingModel upComingModel=UpComingModel.fromJson(response.data);
      print(upComingModel.results?[0].backdropPath);
      return Right(upComingModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }

    }

  @override
  Future<Either<Failures, TopRatedModel>> getTopRated() async{
    Dio dio = Dio();

    try {
    var response=await dio.get(  "$baseUrl/top_rated?$apiKey");
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

