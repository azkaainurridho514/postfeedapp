import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postfeedapp/features/post/domain/entity/post_entity.dart';
import 'package:postfeedapp/features/post/presentation/bloc/comment/comment_bloc.dart';
import 'package:postfeedapp/features/post/presentation/bloc/comment/comment_event.dart';
import 'package:postfeedapp/features/post/presentation/bloc/comment/comment_state.dart';
import 'package:postfeedapp/features/post/presentation/widget/card_comment.dart';
import 'package:postfeedapp/utils/colors/app_colors.dart';
import 'package:postfeedapp/utils/constant/enums.dart';

class CommentPostPage extends StatefulWidget {
  final PostEntity post;

  const CommentPostPage({super.key, required this.post});

  @override
  State<CommentPostPage> createState() => _CommentPostPageState();
}

class _CommentPostPageState extends State<CommentPostPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostCommentBloc>().add(
      GetCommentsByPostId(postId: widget.post.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Comments',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<PostCommentBloc, PostCommentState>(
        builder: (context, state) {
          if (state.status == StatusForm.loading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state.status == StatusForm.failure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.danger.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.error_outline,
                        size: 40,
                        color: AppColors.danger,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.error ?? 'Terjadi kesalahan saat memuat komentar',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.danger,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<PostCommentBloc>().add(
                          GetCommentsByPostId(postId: widget.post.id),
                        );
                      },
                      icon: const Icon(Icons.refresh, size: 18),
                      label: const Text('Coba Lagi'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state.status == StatusForm.success) {
            return RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () async {
                context.read<PostCommentBloc>().add(
                  GetCommentsByPostId(postId: widget.post.id),
                );
              },
              child: ListView(
                padding: const EdgeInsets.all(14),
                children: [
                  // Original Post Overview
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.article_outlined,
                              size: 18,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                widget.post.title,
                                style: AppTextStyles.title.copyWith(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.post.body,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                  ),

                  // Header Comment Count
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, left: 4),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 18,
                          color: AppColors.textPrimary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Comments (${state.commentList.length})',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Comments List or Empty State
                  if (state.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_rounded,
                              size: 48,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Belum ada komentar.',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    ...state.commentList.map(
                      (comment) => CardComment(comment: comment),
                    ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
