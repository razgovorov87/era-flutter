part of 'home_screen_cubit.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default(<Article>[]) List<Article> featuredArticles,
    @Default(<Article>[]) List<Article> latestArticles,
  }) = _HomeScreenState;
}
