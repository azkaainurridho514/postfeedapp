import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postfeedapp/features/post/presentation/bloc/user/user_event.dart';
import 'package:postfeedapp/utils/constant/enums.dart';
import '../../../../utils/colors/app_colors.dart';
import '../bloc/user/user_bloc.dart';
import '../bloc/user/user_state.dart';
import '../widget/card_post.dart';

class UserPost extends StatefulWidget {
  final int userID;
  const UserPost({super.key, required this.userID});

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  @override
  void initState() {
    context.read<PostUserBloc>().add(GetAllPostUser(id: widget.userID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          "All Post User #${widget.userID}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<PostUserBloc, PostUserState>(
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
                      state.error ?? "Terjadi kesalahan",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.danger,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<PostUserBloc>().add(
                          GetAllPostUser(id: widget.userID),
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
            if (state.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      size: 56,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Tidak ada post.',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () async {
                context.read<PostUserBloc>().add(
                  GetAllPostUser(id: widget.userID),
                );
              },
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 24),
                itemCount: state.postList.length,
                itemBuilder: (context, i) => PostCard(post: state.postList[i]),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
