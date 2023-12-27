import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../../user_detail/domain/entities/user_detail_entity.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';

class OPAboutViewWidget extends StatelessWidget {
  const OPAboutViewWidget({super.key, required this.userEntity});
  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    UserDetailEntity? userDetail =
        context.watch<UserDetailProvider>().otherUserDetail;
    Failure? failure = context.watch<UserDetailProvider>().otherUserfailure;
    late Widget aboutWidget;
    if (userDetail != null) {
      aboutWidget = SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (userDetail.description != null && userDetail.description != "")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: context.textTheme.titleMedium,
                  ),
                  Text(userDetail.description!),
                  const Divider()
                ],
              ),
            if (userDetail.tiktok != null ||
                userDetail.whatsApp != null ||
                userDetail.twitter != null ||
                userDetail.instagram != null ||
                userDetail.facebook != null)
              Text(
                "Social Media",
                style: context.textTheme.titleMedium,
              ),
            if (userDetail.whatsApp != null && userDetail.whatsApp != "")
              TextButton.icon(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      foregroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {},
                  icon: const Icon(Icons.wechat),
                  label: const Text("Whatsapp")),
            if (userDetail.facebook != null && userDetail.facebook != "")
              TextButton.icon(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      foregroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {},
                  icon: const Icon(Icons.facebook),
                  label: const Text("Facebook")),
            if (userDetail.twitter != null && userDetail.twitter != "")
              TextButton.icon(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      foregroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {},
                  icon: const Icon(Icons.one_x_mobiledata),
                  label: const Text("Twitter")),
            if (userDetail.instagram != null && userDetail.instagram != "")
              TextButton.icon(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      foregroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {},
                  icon: const Icon(Icons.camera),
                  label: const Text("Instagram")),
            if (userDetail.tiktok != null && userDetail.tiktok != "")
              TextButton.icon(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      foregroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {},
                  icon: const Icon(Icons.tiktok),
                  label: const Text("TikTok")),
            if (userDetail.tiktok != null ||
                userDetail.whatsApp != null ||
                userDetail.twitter != null ||
                userDetail.instagram != null ||
                userDetail.facebook != null)
              const Divider(),
            Text(
              "More Info",
              style: context.textTheme.titleMedium,
            ),
            if (userDetail.web != null && userDetail.web != "")
              TextButton.icon(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      foregroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {},
                  icon: const Icon(Icons.travel_explore),
                  label: Text(userDetail.web!)),
            if (userDetail.adress != null && userDetail.adress != "")
              TextButton.icon(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {},
                  icon: const Icon(Icons.location_on_outlined),
                  label: Text(userDetail.adress!)),
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
                      "Joined since ${userDetail.createdDate?.toString()}"),
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
                  child: Text("${userEntity.view.toString()} views"),
                ),
              ],
            ),
          ],
        ),
      );
    } else if (failure != null) {
      aboutWidget = const Center(
        child: Text("No Data"),
      );
    } else {
      aboutWidget = const Center(
        child: CircularProgressIndicator(),
      );
      // context.read<UserDetailProvider>().eitherGetOtherUserDetailVoidOrFailure(
      //     params: UserDetailParams(id: userEntity.id));
    }
    return aboutWidget;
  }
}
