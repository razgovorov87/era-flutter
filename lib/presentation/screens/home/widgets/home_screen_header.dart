import 'package:era_flutter/presentation/application/extensions/context_extension.dart';
import 'package:era_flutter/presentation/design/animations/app_tap_animate.dart';
import 'package:flutter/material.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingTop = context.padding.top;

    return Container(
      padding: EdgeInsets.only(top: paddingTop),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AppTapAnimate(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  'Mark all read',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
