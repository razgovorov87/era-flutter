import 'package:era_flutter/domain/use_case/articles/fetch_featured_articles_use_case.dart';
import 'package:era_flutter/domain/use_case/articles/fetch_latest_articles_use_case.dart';
import 'package:era_flutter/domain/use_case/articles/mark_readed_articles_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/domain.dart';

part 'home_screen_cubit.freezed.dart';
part 'home_screen_state.dart';

@injectable
class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit(
    this._fetchFeaturedArticlesUseCase,
    this._fetchLatestArticlesUseCase,
    this._markReadedArticlesUseCase,
  ) : super(const HomeScreenState()) {
    _fetchData();
  }

  final FetchFeaturedArticlesUseCase _fetchFeaturedArticlesUseCase;
  final FetchLatestArticlesUseCase _fetchLatestArticlesUseCase;
  final MarkReadedArticlesUseCase _markReadedArticlesUseCase;

  Future<void> _fetchData() async {
    final futures = await Future.wait([
      _fetchFeaturedArticlesUseCase.execute(),
      _fetchLatestArticlesUseCase.execute(),
    ]);

    emit(state.copyWith(
      featuredArticles: futures[0],
      latestArticles: futures[1],
    ));
  }

  Future<void> markAllRead() async {
    if (state.latestArticles.isEmpty) return;

    await _markReadedArticlesUseCase.execute(state.latestArticles.map((e) => e.id).toList());
    await _fetchData();
  }
}
