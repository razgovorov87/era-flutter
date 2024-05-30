import 'package:era_flutter/domain/models/article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getLatestArticles();

  Future<List<Article>> getFeaturedArticles();

  Future<Article> getArticle(String id);

  Future<void> markReadedArticles(List<String> articlesIds);
}
