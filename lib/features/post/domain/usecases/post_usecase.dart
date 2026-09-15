import 'package:dartz/dartz.dart';
import 'package:postfeedapp/features/post/data/models/post_model.dart';
import 'package:postfeedapp/features/post/domain/repositories/post_repository.dart';
import 'package:postfeedapp/utils/errors/failures.dart';

class PostUsecase {
  final PostRepository repository;
  const PostUsecase(this.repository);

  Future<Either<Failure, PostModel>> call() async => repository.getPosts();
}
