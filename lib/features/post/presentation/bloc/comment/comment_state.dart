import 'package:equatable/equatable.dart';
import 'package:postfeedapp/features/post/data/models/comment_model.dart';
import 'package:postfeedapp/utils/constant/enums.dart';

class PostCommentState extends Equatable {
  final StatusForm status;
  final CommentModel? comments;
  final String? error;

  const PostCommentState({
    this.status = StatusForm.initial,
    this.comments,
    this.error,
  });

  bool get isEmpty => comments == null || comments!.comments.isEmpty;
  List<CommentData> get commentList => comments?.comments ?? [];

  PostCommentState copyWith({
    StatusForm? status,
    CommentModel? comments,
    String? error,
  }) {
    return PostCommentState(
      error: error ?? this.error,
      comments: comments ?? this.comments,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, comments, error];
}
