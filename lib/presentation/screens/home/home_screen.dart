import 'package:auto_route/auto_route.dart';
import 'package:era_flutter/presentation/application/extensions/context_extension.dart';
import 'package:era_flutter/presentation/application/get_it/get_it_service_locator.dart';
import 'package:era_flutter/presentation/screens/home/cubit/home_screen_cubit/home_screen_cubit.dart';
import 'package:era_flutter/presentation/screens/home/widgets/featured_list.dart';
import 'package:era_flutter/presentation/screens/home/widgets/home_screen_header.dart';
import 'package:era_flutter/presentation/screens/home/widgets/latest_news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenCubit _homeScreenCubit;

  @override
  void initState() {
    super.initState();
    _homeScreenCubit = getIt.get<HomeScreenCubit>();
  }

  @override
  void dispose() {
    _homeScreenCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider.value(
        value: _homeScreenCubit,
        child: Scaffold(
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
                delegate: FeaturedListDelegate(context: context),
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
              const LatestNewsList(),
              SliverToBoxAdapter(child: SizedBox(height: context.padding.bottom + 24)),
            ],
          ),
        ),
      ),
    );
  }
}
