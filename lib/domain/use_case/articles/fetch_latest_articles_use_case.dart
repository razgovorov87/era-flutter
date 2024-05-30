import 'package:era_flutter/domain/models/article.dart';
import 'package:era_flutter/domain/repository/articles_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchLatestArticlesUseCase {
  FetchLatestArticlesUseCase(this._articlesRepository);

  final ArticlesRepository _articlesRepository;

  Future<List<Article>> execute() => _articlesRepository.getLatestArticles();
}
