import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:era_flutter/domain/models/article.dart';
import 'package:era_flutter/presentation/application/extensions/context_extension.dart';
import 'package:era_flutter/presentation/design/animations/app_tap_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArticleScreenHeaderDelegate extends SliverPersistentHeaderDelegate {
  ArticleScreenHeaderDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.article,
  });

  final Article article;
  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double zeroToMax = (max(0, shrinkOffset) / (maxExtent - minExtent)).clamp(0, 1);

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(12),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.network(
              article.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Positioned(
            left: 48,
            bottom: 40 - (15 * zeroToMax),
            right: 96 * (1 - zeroToMax),
            child: Text(
              article.title,
              style: TextStyle(
                fontSize: 28 - (8 * zeroToMax),
                letterSpacing: 0.1,
                color: Colors.white,
              ),
            ),
          ),
          const _Actions(),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(ArticleScreenHeaderDelegate oldDelegate) {
    return false;
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.padding.top,
      right: 0,
      left: 0,
      child: AppTapAnimate(
        onTap: () {
          context.router.maybePop();
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          alignment: Alignment.centerLeft,
          height: 80,
          child: SvgPicture.asset('assets/icons/chevron_left.svg'),
        ),
      ),
    );
  }
}
