import 'package:auto_route/auto_route.dart';
import 'package:era_flutter/domain/models/article.dart';
import 'package:era_flutter/presentation/application/extensions/context_extension.dart';
import 'package:era_flutter/presentation/screens/article/widgets/article_screen_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class ArticleScreen extends StatefulWidget {
  const ArticleScreen({
    super.key,
    required this.article,
    required this.markRead,
  });

  final Article article;
  final VoidCallback markRead;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  void initState() {
    super.initState();
    if (!widget.article.readed) {
      widget.markRead.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: ArticleScreenHeaderDelegate(
                article: widget.article,
                minHeight: context.padding.top + 80,
                maxHeight: context.getSize().height * 0.55,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    if (widget.article.description != null) ...[
                      Text.rich(
                        TextSpan(
                          text: widget.article.description!,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(widget.article.imageUrl),
                    ),
                    SizedBox(height: context.padding.bottom + 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
