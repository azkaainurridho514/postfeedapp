import 'package:dartz/dartz.dart';

import '../../../../utils/errors/failures.dart';
import '../../data/models/post_model.dart';

abstract class PostUserRepository {
  Future<Either<Failure, PostModel>> getPostsUser({required int id});
}
