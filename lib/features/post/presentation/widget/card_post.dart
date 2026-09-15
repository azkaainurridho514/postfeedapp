import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postfeedapp/utils/di/injection.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../domain/entity/post_entity.dart';
import '../bloc/user/user_bloc.dart';
import '../pages/user_post.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;

  const PostCard({super.key, required this.post});

  Color _avatarColor(int userId) {
    return AppColors.avatarColors[userId % AppColors.avatarColors.length];
  }

  Color _tagColor(int index) {
    return AppColors.tagColors[index % AppColors.tagColors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (_) => BlocProvider(
                                create: (context) => getIt<PostUserBloc>(),
                                child: UserPost(userID: post.userId),
                              ),
                        ),
                      ),
                  child: Container(
                    color: AppColors.cardBackground,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: _avatarColor(post.userId),
                          child: Text(
                            '${post.userId}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'User #${post.userId}',
                          style: AppTextStyles.caption,
                        ),
                        const Spacer(),
                        Icon(Icons.chevron_right, color: Colors.grey[400]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                Text(post.title, style: AppTextStyles.title),
                const SizedBox(height: 6),

                Text(
                  post.body,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 12),

                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children:
                      post.tags.asMap().entries.map((entry) {
                        final color = _tagColor(entry.key);
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '#${entry.value}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: color,
                            ),
                          ),
                        );
                      }).toList(),
                ),
                const SizedBox(height: 14),
                Divider(height: 1, color: Colors.grey[200]),
                const SizedBox(height: 10),

                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _StatChip(
                      icon: Icons.favorite_rounded,
                      value: post.reactions.likes,
                      color: AppColors.like,
                    ),
                    _StatChip(
                      icon: Icons.heart_broken_rounded,
                      value: post.reactions.dislikes,
                      color: AppColors.dislike,
                    ),
                    _StatChip(
                      icon: Icons.remove_red_eye_rounded,
                      value: post.views,
                      color: AppColors.views,
                    ),
                    _StatChip(
                      icon: Icons.message_rounded,
                      value: "Comment",
                      color: AppColors.textSecondary,
                      onTap: () => print("To Page Comment"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final dynamic value;
  final Color color;
  final VoidCallback? onTap;

  const _StatChip({
    required this.icon,
    required this.value,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(onTap != null ? 100 : 10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              '$value',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
