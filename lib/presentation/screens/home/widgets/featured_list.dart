import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:era_flutter/domain/models/article.dart';
import 'package:era_flutter/presentation/design/animations/app_tap_animate.dart';
import 'package:era_flutter/presentation/router/auto_router.gr.dart';
import 'package:era_flutter/presentation/screens/home/cubit/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListDelegate extends SliverPersistentHeaderDelegate {
  FeaturedListDelegate({
    required this.context,
  });
  final BuildContext context;

  @override
  double get minExtent => _featuredListMinHeight;

  @override
  double get maxExtent => _featuredListMaxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double zeroToMax = (max(0, shrinkOffset) / (maxExtent - minExtent)).clamp(0, 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Text(
            'Featured',
            style: _titleTextStyle,
          ),
        ),
        Expanded(
          child: _ArticlesCarousel(zeroToMax: zeroToMax),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(FeaturedListDelegate oldDelegate) {
    return false;
  }

  TextStyle get _titleTextStyle => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        height: 24 / 20,
      );

  double get _titleHeight => (TextPainter(
          text: TextSpan(
            text: 'Featured',
            style: _titleTextStyle,
          ),
          maxLines: 1,
          textScaler: MediaQuery.of(context).textScaler,
          textDirection: TextDirection.ltr)
        ..layout())
      .size
      .height;

  double get _featuredListMinHeight {
    return _titleHeight + 40 + 103;
  }

  double get _featuredListMaxHeight {
    return _titleHeight + 40 + 300;
  }
}

class _ArticlesCarousel extends StatelessWidget {
  const _ArticlesCarousel({
    required this.zeroToMax,
  });

  final double zeroToMax;

  @override
  Widget build(BuildContext context) {
    final articles = context.watch<HomeScreenCubit>().state.featuredArticles;

    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        viewportFraction: 0.9,
        aspectRatio: 1,
        enlargeCenterPage: true,
      ),
      items: [
        ...articles.map(
          (e) => _CarouselItem(
            article: e,
            zeroToMax: zeroToMax,
          ),
        )
      ],
    );
  }
}

class _CarouselItem extends StatelessWidget {
  const _CarouselItem({
    required this.article,
    required this.zeroToMax,
  });

  final double zeroToMax;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return AppTapAnimate(
      onTap: () {
        context.router.push(ArticleRoute(
          article: article,
          markRead: () {
            context.read<HomeScreenCubit>().markRead([article.id]);
          },
        ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              article.imageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.6),
            ),
            Positioned(
              bottom: 40 - (26 * zeroToMax),
              left: 20,
              right: 68,
              child: Text(
                article.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
