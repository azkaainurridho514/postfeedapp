import 'package:postfeedapp/features/post/domain/entity/comment_entity.dart';

class CommentModel {
  final List<CommentData> comments;
  final int total;
  final int skip;
  final int limit;

  const CommentModel({
    required this.comments,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CommentModel.fromJson(dynamic json) {
    return CommentModel(
      total: json["total"] ?? 0,
      skip: json["skip"] ?? 0,
      limit: json["limit"] ?? 0,
      comments:
          json["comments"] is List
              ? List<CommentData>.from(
                json["comments"].map((item) => CommentData.fromJson(item)),
              )
              : <CommentData>[],
    );
  }
}

class CommentData extends CommentEntity {
  const CommentData({
    required super.id,
    required super.body,
    required super.postId,
    required super.likes,
    required super.user,
  });

  factory CommentData.fromJson(dynamic json) {
    return CommentData(
      id: json["id"] ?? 0,
      body: json["body"] ?? '',
      postId: json["postId"] ?? 0,
      likes: json["likes"] ?? 0,
      user:
          json["user"] != null
              ? UserCommentModel.fromJson(json["user"])
              : const UserCommentEntity(id: 0, username: '', fullName: ''),
    );
  }
}

class UserCommentModel extends UserCommentEntity {
  const UserCommentModel({
    required super.id,
    required super.username,
    required super.fullName,
  });

  factory UserCommentModel.fromJson(dynamic json) {
    return UserCommentModel(
      id: json["id"] ?? 0,
      username: json["username"] ?? '',
      fullName: json["fullName"] ?? '',
    );
  }
}

typedef CommentUserModel = UserCommentModel;
