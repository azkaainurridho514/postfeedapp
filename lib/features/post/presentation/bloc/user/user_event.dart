import 'package:equatable/equatable.dart';

abstract class PostUserEvent extends Equatable {
  const PostUserEvent();

  @override
  List<Object?> get props => [];
}

class GetAllPostUser extends PostUserEvent {
  final int id;
  const GetAllPostUser({required this.id});
}
