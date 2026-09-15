import 'package:equatable/equatable.dart';
import 'package:postfeedapp/features/post/data/models/post_model.dart';
import 'package:postfeedapp/utils/constant/enums.dart';

class PostUserState extends Equatable {
  final StatusForm status;
  final PostModel? posts;
  final String? error;

  const PostUserState({
    this.status = StatusForm.initial,
    this.posts,
    this.error,
  });
  bool get isEmpty => posts == null || posts!.posts.isEmpty;
  List<Data> get postList => posts?.posts ?? [];

  PostUserState copyWith({
    StatusForm? status,
    PostModel? posts,
    String? error,
  }) {
    return PostUserState(
      error: error ?? this.error,
      posts: posts ?? this.posts,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, posts, error];
}
