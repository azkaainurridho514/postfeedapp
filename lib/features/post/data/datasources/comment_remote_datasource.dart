import 'package:dio/dio.dart';
import 'package:postfeedapp/utils/errors/exceptions.dart';

import '../../../../utils/constant/constant.dart';
import '../models/comment_model.dart';

class PostCommentRemoteDatasource {
  final Dio dio;

  PostCommentRemoteDatasource(this.dio);

  Future<CommentModel> getComments({required int postId}) async {
    try {
      final res = await dio.get('${ApiConstants.comment}$postId');

      if (res.statusCode == 200) {
        return CommentModel.fromJson(res.data);
      } else {
        throw ApiException(res.statusMessage.toString());
      }
    } on DioException catch (e) {
      throw ApiException(e.message.toString());
    }
  }
}
