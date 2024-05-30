import 'package:era_flutter/domain/repository/articles_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MarkReadedArticlesUseCase {
  MarkReadedArticlesUseCase(this._articlesRepository);

  final ArticlesRepository _articlesRepository;

  Future<void> execute(List<String> ids) => _articlesRepository.markReadedArticles(ids);
}
