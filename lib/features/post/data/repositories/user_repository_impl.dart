import 'package:dartz/dartz.dart';
import 'package:postfeedapp/features/post/data/models/post_model.dart';
import 'package:postfeedapp/utils/errors/failures.dart';

import '../../../../utils/errors/exceptions.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';

class PostUserRepositoryImpl extends PostUserRepository {
  final PostUserRemoteDatasource remote;

  PostUserRepositoryImpl(this.remote);
  @override
  Future<Either<Failure, PostModel>> getPostsUser({required int id}) async {
    try {
      final res = await remote.getPostsUser(id: id);
      return Right(res);
    } on ApiException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure('Terjadi kesalahan tak terduga: $e'));
    }
  }
}
