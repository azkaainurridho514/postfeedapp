import 'package:dartz/dartz.dart';

import '../../../../utils/errors/failures.dart';
import '../../data/models/comment_model.dart';

abstract class PostCommentRepository {
  Future<Either<Failure, CommentModel>> getComments({required int postId});
}
