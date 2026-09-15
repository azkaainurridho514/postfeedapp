import 'package:dartz/dartz.dart';
import 'package:postfeedapp/features/post/data/datasources/post_remote_datasource.dart';
import 'package:postfeedapp/features/post/data/models/post_model.dart';
import 'package:postfeedapp/features/post/domain/repositories/post_repository.dart';
import 'package:postfeedapp/utils/errors/failures.dart';

import '../../../../utils/errors/exceptions.dart';

class PostRepositoryImpl extends PostRepository {
  final PostRemoteDatasource remote;

  PostRepositoryImpl(this.remote);
  @override
  Future<Either<Failure, PostModel>> getPosts() async {
    try {
      final res = await remote.getPosts();
      return Right(res);
    } on ApiException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure('Terjadi kesalahan tak terduga: $e'));
    }
  }
}
