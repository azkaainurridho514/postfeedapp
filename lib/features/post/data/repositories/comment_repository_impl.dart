import 'package:dartz/dartz.dart';
import 'package:postfeedapp/features/post/data/models/comment_model.dart';
import 'package:postfeedapp/utils/errors/failures.dart';

import '../../../../utils/errors/exceptions.dart';
import '../../domain/repositories/comment_repository.dart';
import '../datasources/comment_remote_datasource.dart';

class PostCommentRepositoryImpl extends PostCommentRepository {
  final PostCommentRemoteDatasource remote;

  PostCommentRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, CommentModel>> getComments({
    required int postId,
  }) async {
    try {
      final res = await remote.getComments(postId: postId);
      return Right(res);
    } on ApiException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure('Terjadi kesalahan tak terduga: $e'));
    }
  }
}
