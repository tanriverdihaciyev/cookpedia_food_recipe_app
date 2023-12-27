import 'package:cookpedia_foodrecipe_app/features/user/presentation/states/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/sizes.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';

class PVAboutViewWidget extends StatelessWidget {
  const PVAboutViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserDetailProvider userDetailProvider = context.watch<UserDetailProvider>();
    UserProvider userProvider = context.watch<UserProvider>();
    Failure? failure = userDetailProvider.failure;
    late Widget aboutWidget;
    if (userDetailProvider.userDetail != null) {
      aboutWidget = SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: context.textTheme.titleMedium,
            ),
            userDetailProvider.userDetail!.description != null &&
                    userDetailProvider.userDetail!.description != ""
                ? Text(userDetailProvider.userDetail!.description!)
                : TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () => context.go(Routes.editProfileRoute),
                    child: const Text("Add Your Description"),
                  ),
            const Divider(),
            Text(
              "Social Media",
              style: context.textTheme.titleMedium,
            ),
            userDetailProvider.userDetail!.whatsApp != null &&
                    userDetailProvider.userDetail!.whatsApp != ""
                ? TextButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {},
                    icon: const Icon(Icons.wechat),
                    label: const Text("Whatsapp"))
                : TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () => context.go(Routes.editProfileRoute),
                    child: const Text("Add Your Whatsapp"),
                  ),
            userDetailProvider.userDetail!.facebook != null &&
                    userDetailProvider.userDetail!.facebook != ""
                ? TextButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {},
                    icon: const Icon(Icons.facebook),
                    label: const Text("Facebook"))
                : TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () => context.go(Routes.editProfileRoute),
                    child: const Text("Add Your Facebook"),
                  ),
            userDetailProvider.userDetail!.twitter != null &&
                    userDetailProvider.userDetail!.twitter != ""
                ? TextButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {},
                    icon: const Icon(Icons.one_x_mobiledata),
                    label: const Text("Twitter"))
                : TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () => context.go(Routes.editProfileRoute),
                    child: const Text("Add Your Twitter"),
                  ),
            userDetailProvider.userDetail!.instagram != null &&
                    userDetailProvider.userDetail!.instagram != ""
                ? TextButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {},
                    icon: const Icon(Icons.camera),
                    label: const Text("Instagram"))
                : TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () => context.go(Routes.editProfileRoute),
                    child: const Text("Add Your Instagram"),
                  ),
            userDetailProvider.userDetail!.tiktok != null &&
                    userDetailProvider.userDetail!.tiktok != ""
                ? TextButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {},
                    icon: const Icon(Icons.tiktok),
                    label: const Text("TikTok"))
                : TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () => context.go(Routes.editProfileRoute),
                    child: const Text("Add Your TikTok"),
                  ),
            const Divider(),
            Text(
              "More Info",
              style: context.textTheme.titleMedium,
            ),
            userDetailProvider.userDetail!.web != null &&
                    userDetailProvider.userDetail!.web != ""
                ? TextButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {},
                    icon: const Icon(Icons.travel_explore),
                    label: Text(userDetailProvider.userDetail!.web!))
                : TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () => context.go(Routes.editProfileRoute),
                    child: const Text("Add Your Web address"),
                  ),
            userDetailProvider.userDetail!.adress != null &&
                    userDetailProvider.userDetail!.adress != ""
                ? TextButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {},
                    icon: const Icon(Icons.location_on_outlined),
                    label: Text(userDetailProvider.userDetail!.adress!))
                : TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () => context.go(Routes.editProfileRoute),
                    child: const Text("Add Your address"),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.info),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: context.width(Sizes.s0_7),
                  child: Text(
                      "Joined since ${userDetailProvider.userDetail!.createdDate?.toString()}"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.stacked_bar_chart),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: context.width(Sizes.s0_7),
                  child: Text("${userProvider.user!.view?.toString()} views"),
                ),
              ],
            ),
          ],
        ),
      );
    } else if (failure != null) {
      aboutWidget = Center(
        child: TextButton(onPressed: () {}, child: const Text("Add About")),
      );
    } else {
      aboutWidget = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return aboutWidget;
  }
}
