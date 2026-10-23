import 'package:dartz/dartz.dart';
import 'package:postfeedapp/features/post/data/models/comment_model.dart';
import 'package:postfeedapp/utils/errors/failures.dart';

import '../repositories/comment_repository.dart';

class PostCommentUsecase {
  final PostCommentRepository repository;
  const PostCommentUsecase(this.repository);

  Future<Either<Failure, CommentModel>> call({required int postId}) async =>
      repository.getComments(postId: postId);
}
