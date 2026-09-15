import 'package:dartz/dartz.dart';

import '../../../../utils/errors/failures.dart';
import '../../data/models/post_model.dart';

abstract class PostRepository {
  Future<Either<Failure, PostModel>> getPosts();
}
