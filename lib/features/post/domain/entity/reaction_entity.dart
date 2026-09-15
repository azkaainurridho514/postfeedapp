import 'package:equatable/equatable.dart';

class ReactionEntity extends Equatable {
  final int likes;
  final int dislikes;

  const ReactionEntity({required this.dislikes, required this.likes});
  @override
  List<Object?> get props => [likes, dislikes];
}
