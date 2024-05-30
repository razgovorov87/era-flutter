import 'package:auto_route/auto_route.dart';
import 'package:era_flutter/domain/domain.dart';
import 'package:era_flutter/presentation/design/animations/app_tap_animate.dart';
import 'package:era_flutter/presentation/router/auto_router.gr.dart';
import 'package:era_flutter/presentation/screens/home/cubit/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class LatestNewsList extends StatelessWidget {
  const LatestNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    final articles = context.watch<HomeScreenCubit>().state.latestArticles;

    return SliverToBoxAdapter(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: articles.length,
        itemBuilder: (_, int index) => _ListItem(
          index: index,
          article: articles[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.index,
    required this.article,
  });

  final int index;
  final Article article;

  @override
  Widget build(BuildContext context) {
    final daysAgo = timeago.format(article.publicationDate);

    return AppTapAnimate(
      onTap: () {
        context.router.push(ArticleRoute(
          article: article,
          markRead: () {
            context.read<HomeScreenCubit>().markRead([article.id]);
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 103,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: index.isEven ? Colors.white : const Color(0xFFF5F5F5),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 15,
              color: Colors.black12,
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 90,
                  child: Image.network(
                    article.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                if (!article.readed)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      width: 15,
                      height: 15,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 23),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Text(
                    daysAgo,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9A9A9A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
