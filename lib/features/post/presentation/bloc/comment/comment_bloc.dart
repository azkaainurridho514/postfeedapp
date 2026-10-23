import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postfeedapp/utils/constant/enums.dart';

import '../../../domain/usecases/comment_usecase.dart';
import 'comment_event.dart';
import 'comment_state.dart';

class PostCommentBloc extends Bloc<PostCommentEvent, PostCommentState> {
  final PostCommentUsecase usecase;

  PostCommentBloc(this.usecase) : super(const PostCommentState()) {
    on<GetCommentsByPostId>(_onGetCommentsByPostId);
  }

  Future<void> _onGetCommentsByPostId(
    GetCommentsByPostId event,
    Emitter<PostCommentState> emit,
  ) async {
    if (state.status == StatusForm.loading) return;
    emit(state.copyWith(status: StatusForm.loading));
    final res = await usecase(postId: event.postId);
    if (emit.isDone) return;
    res.fold(
      (l) {
        emit(state.copyWith(status: StatusForm.failure, error: l.message));
      },
      (r) {
        emit(state.copyWith(status: StatusForm.success, comments: r));
      },
    );
  }
}
