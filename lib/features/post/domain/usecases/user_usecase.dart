import 'package:dartz/dartz.dart';
import 'package:postfeedapp/features/post/data/models/post_model.dart';
import 'package:postfeedapp/utils/errors/failures.dart';

import '../repositories/user_repository.dart';

class PostUserUsecase {
  final PostUserRepository repository;
  const PostUserUsecase(this.repository);

  Future<Either<Failure, PostModel>> call({required int id}) async =>
      repository.getPostsUser(id: id);
}
