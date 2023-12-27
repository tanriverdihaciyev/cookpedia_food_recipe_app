import '../../../../core/companents/cards/recipe_card.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../../user/presentation/states/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopChefsView extends StatelessWidget {
  const TopChefsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Chefs"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: context.paddingAllMedium,
        child: const TCBodyWidget(),
      ),
    );
  }
}

class TCBodyWidget extends StatelessWidget {
  const TCBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserEntity>? topUsers = context.watch<UserProvider>().topUsers;
    Failure? failure = context.watch<UserProvider>().topUsersFailure;
    late Widget child;
    if (topUsers != null) {
      child = GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Sizes.s2,
          childAspectRatio: Sizes.s0_8,
        ),
        itemCount: topUsers.length,
        itemBuilder: (BuildContext context, int index) {
          return ChefCard(userEntity: topUsers[index]);
        },
      );
    } else if (failure != null) {
      child = const SizedBox();
    } else {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return child;
  }
}
