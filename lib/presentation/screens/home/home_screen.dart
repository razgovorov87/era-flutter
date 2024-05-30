import 'package:era_flutter/presentation/screens/home/widgets/home_screen_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          flexibleSpace: const HomeScreenHeader(),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(context: context),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Latest News',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 24 / 20,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 103,
                      color: Colors.blue,
                    );
                  },
                  childCount: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate({
    required this.context,
  });
  final BuildContext context;

  @override
  double get minExtent => _featuredListMinHeight;

  @override
  double get maxExtent => _featuredListMaxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Featured',
              style: _titleTextStyle,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegate) {
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
