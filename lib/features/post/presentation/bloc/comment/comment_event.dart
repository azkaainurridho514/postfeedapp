import 'package:equatable/equatable.dart';

abstract class PostCommentEvent extends Equatable {
  const PostCommentEvent();

  @override
  List<Object?> get props => [];
}

class GetCommentsByPostId extends PostCommentEvent {
  final int postId;
  const GetCommentsByPostId({required this.postId});

  @override
  List<Object?> get props => [postId];
}
