import '../../domain/entity/reaction_entity.dart';

class ReactionModel extends ReactionEntity {
  const ReactionModel({required super.likes, required super.dislikes});

  factory ReactionModel.fromJson(dynamic json) {
    return ReactionModel(
      likes: json["likes"] ?? 0,
      dislikes: json["dislikes"] ?? 0,
    );
  }
}
