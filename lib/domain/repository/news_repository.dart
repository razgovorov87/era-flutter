import 'package:era_flutter/domain/models/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getLatestArticles();
  Future<List<Article>> getFeaturedArticles();
  Future<Article> getArticle(String id);
}
