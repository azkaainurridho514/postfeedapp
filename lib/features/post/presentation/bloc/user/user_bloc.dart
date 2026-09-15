import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postfeedapp/utils/constant/enums.dart';

import '../../../domain/usecases/user_usecase.dart';
import 'user_event.dart';
import 'user_state.dart';

class PostUserBloc extends Bloc<PostUserEvent, PostUserState> {
  final PostUserUsecase usecase;
  PostUserBloc(this.usecase) : super(PostUserState()) {
    on<GetAllPostUser>(_onGetAllPostUser);
  }

  Future<void> _onGetAllPostUser(
    GetAllPostUser event,
    Emitter<PostUserState> emit,
  ) async {
    if (state.status == StatusForm.loading) return;
    emit(state.copyWith(status: StatusForm.loading));
    final res = await usecase(id: event.id);
    if (emit.isDone) return;
    res.fold(
      (l) {
        emit(state.copyWith(status: StatusForm.failure, error: l.message));
      },
      (r) {
        emit(state.copyWith(status: StatusForm.success, posts: r));
      },
    );
  }
}
