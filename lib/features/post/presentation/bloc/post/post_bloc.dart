import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postfeedapp/features/post/domain/usecases/post_usecase.dart';
import 'package:postfeedapp/features/post/presentation/bloc/post/post_event.dart';
import 'package:postfeedapp/features/post/presentation/bloc/post/post_state.dart';
import 'package:postfeedapp/utils/constant/enums.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostUsecase usecase;
  PostBloc(this.usecase) : super(PostState()) {
    on<GetAllPost>(_onGetAllPost);
  }

  Future<void> _onGetAllPost(GetAllPost event, Emitter<PostState> emit) async {
    if (state.status == StatusForm.loading) return;
    emit(state.copyWith(status: StatusForm.loading));
    final res = await usecase();
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
