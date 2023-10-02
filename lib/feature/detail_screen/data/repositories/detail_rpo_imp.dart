import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app1/core/failure.dart';
import 'package:movies_app1/feature/detail_screen/data/models/detail_model.dart';
import '../../../../core/constants.dart';
import '../models/simillar_model.dart';
import 'detail_rpo.dart';

class DetailRpoImp extends DetailRpo {
  @override
  Future<Either<Failures, DetailModel>> getDetail({required int id}) async {
    Dio dio = Dio();
    try {
      var response = await dio.get("$baseUrl/$id?$apiKey");
      DetailModel detailModel = DetailModel.fromJson(response.data);
      print(detailModel.title);
    return  right(detailModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failures, SimilarModel>> getSimilar({required int id}) async{
    Dio dio = Dio();
    try {
      var response = await dio.get("$baseUrl/$id/similar?$apiKey");
      SimilarModel similarModel = SimilarModel.fromJson(response.data);
      print(similarModel.results?[0].title);
      return  right(similarModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
