import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final int id;
  final String body;
  final int postId;
  final int likes;
  final UserCommentEntity user;

  const CommentEntity({
    required this.id,
    required this.body,
    required this.postId,
    required this.likes,
    required this.user,
  });

  @override
  List<Object?> get props => [id, body, postId, likes, user];
}

class UserCommentEntity extends Equatable {
  final int id;
  final String username;
  final String fullName;

  const UserCommentEntity({
    required this.id,
    required this.username,
    required this.fullName,
  });

  @override
  List<Object?> get props => [id, username, fullName];
}
