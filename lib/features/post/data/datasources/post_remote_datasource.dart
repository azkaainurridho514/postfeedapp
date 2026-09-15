import 'package:dio/dio.dart';
import 'package:postfeedapp/utils/errors/exceptions.dart';

import '../../../../utils/constant/constant.dart';
import '../models/post_model.dart';

class PostRemoteDatasource {
  final Dio dio;

  PostRemoteDatasource(this.dio);

  Future<PostModel> getPosts() async {
    try {
      final res = await dio.get(ApiConstants.post);

      if (res.statusCode == 200) {
        return PostModel.fromJson(res.data);
      } else {
        throw ApiException(res.statusMessage.toString());
      }
    } on DioException catch (e) {
      throw ApiException(e.message.toString());
    }
  }
}
