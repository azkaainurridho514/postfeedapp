import 'package:postfeedapp/features/post/domain/entity/post_entity.dart';

import '../../domain/entity/reaction_entity.dart';
import 'reaction_model.dart';

class PostModel {
  final List<Data> posts;
  final int total;
  final int skip;
  final int limit;
  const PostModel({
    required this.posts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory PostModel.fromJson(dynamic json) {
    return PostModel(
      limit: json["limit"] ?? 0,
      skip: json["skip"] ?? 0,
      total: json["total"] ?? 0,
      posts:
          json["posts"] is List
              ? List<Data>.from(
                json["posts"].map((item) => Data.fromJson(item)),
              )
              : <Data>[],
    );
  }
}

class Data extends PostEntity {
  const Data({
    required super.id,
    required super.title,
    required super.body,
    required super.tags,
    required super.reactions,
    required super.views,
    required super.userId,
  });

  factory Data.fromJson(dynamic json) {
    return Data(
      id: json["id"],
      body: json["body"],
      reactions:
          json["reactions"] != null
              ? ReactionModel.fromJson(json["reactions"])
              : const ReactionEntity(likes: 0, dislikes: 0),
      tags:
          json["tags"] is List
              ? List<String>.from(json["tags"].map((i) => i.toString()))
              : [],
      title: json["title"],
      userId: json["userId"],
      views: json["views"],
    );
  }
}
