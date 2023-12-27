import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/params/follow_params.dart';
import '../../../../core/resources/sizes.dart';
import '../../../follow/presentation/states/follow_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../widgets/profile_app_bar_widget.dart';
import '../widgets/profile_body_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<UserProvider>().user != null) {
      final activeUserId = context.watch<UserProvider>().user!.id;
      context.read<FollowProvider>().eitherUserFollowedOrFailure(
            params: FollowUserParams(userID: activeUserId),
          );
      context.read<FollowProvider>().eitherUserFollowersOrFailure(
            params: FollowUserParams(userID: activeUserId),
          );
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(context.width(), context.height(Sizes.s0_1)),
          child: const ProfileAppBarWidget()),
      body: const ProfileBodyWidget(),
    );
  }
}

class CounterTitle extends StatelessWidget {
  const CounterTitle({
    super.key,
    required this.title,
    required this.counter,
  });

  final String title;
  final String counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          counter,
        ),
        Text(
          title,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
