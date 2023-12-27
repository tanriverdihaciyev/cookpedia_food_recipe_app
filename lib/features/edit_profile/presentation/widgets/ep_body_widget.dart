import '../../../../core/constants/user_constants.dart';
import '../../../../core/constants/user_detail_constants.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/params/user_detail_params.dart';
import '../../../../core/params/user_params.dart';
import '../states/ep_form_key_provider.dart';
import 'ep_image_widget.dart';
import 'ep_text_from_widget.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EPBodyWidget extends StatelessWidget {
  const EPBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserDetailProvider userDetailProvider = context.watch<UserDetailProvider>();
    UserProvider userProvider = context.watch<UserProvider>();
    EPFormKeyProvider formKeyProvider = context.watch<EPFormKeyProvider>();
    return Padding(
      padding: context.paddingHorizMedium,
      child: Form(
        key: formKeyProvider.formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(child: EPImageWidget()),
            const SizedBox(
              height: 5,
            ),
            EPTextFormFieldWidget(
              hintText: "Display Name",
              value: userDetailProvider.userDetail?.displayName,
              onSaved: (displayName) async {
                await userDetailProvider.eitherUpdateUserDetailVoidOrFailure(
                  params: UpdateUserDetailParams(
                    userID: userProvider.user!.id,
                    contentTitle: kDisplayName,
                    contentBody: displayName!,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Username",
              value: userProvider.user?.userName,
              validator: (userName) {
                if (userName == "") {
                  return "Is not Empty";
                }
                return null;
              },
              onSaved: (userName) async {
                if (userName != null || userName != "") {
                  await userProvider.eitherUpdateUserOrFailure(
                    params: UpdateUserParams(
                      userID: userProvider.user!.id,
                      contentTitle: kUserName,
                      contentBody: userName!,
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Description",
              value: userDetailProvider.userDetail?.description,
              minLines: 1,
              maxLines: 3,
              onSaved: (description) async {
                await userDetailProvider.eitherUpdateUserDetailVoidOrFailure(
                  params: UpdateUserDetailParams(
                    userID: userProvider.user!.id,
                    contentTitle: kDescription,
                    contentBody: description!,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const Text("Sosial Media"),
            const SizedBox(
              height: 20,
            ),
            EPTextFormFieldWidget(
              hintText: "Whatsapp",
              value: userDetailProvider.userDetail?.whatsApp,
              onSaved: (whatsapp) async {
                await userDetailProvider.eitherUpdateUserDetailVoidOrFailure(
                  params: UpdateUserDetailParams(
                    userID: userProvider.user!.id,
                    contentTitle: kWhatsApp,
                    contentBody: whatsapp!,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Facebook",
              value: userDetailProvider.userDetail?.facebook,
              onSaved: (facebook) async {
                await userDetailProvider.eitherUpdateUserDetailVoidOrFailure(
                  params: UpdateUserDetailParams(
                    userID: userProvider.user!.id,
                    contentTitle: kFacebook,
                    contentBody: facebook!,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Twitter",
              value: userDetailProvider.userDetail?.twitter,
              onSaved: (twitter) async {
                await userDetailProvider.eitherUpdateUserDetailVoidOrFailure(
                  params: UpdateUserDetailParams(
                    userID: userProvider.user!.id,
                    contentTitle: kTwitter,
                    contentBody: twitter!,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Tiktok",
              value: userDetailProvider.userDetail?.tiktok,
              onSaved: (tiktok) async {
                await userDetailProvider.eitherUpdateUserDetailVoidOrFailure(
                  params: UpdateUserDetailParams(
                    userID: userProvider.user!.id,
                    contentTitle: kTiktok,
                    contentBody: tiktok!,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Instagram",
              value: userDetailProvider.userDetail?.instagram,
              onSaved: (instagram) async {
                await userDetailProvider.eitherUpdateUserDetailVoidOrFailure(
                  params: UpdateUserDetailParams(
                    userID: userProvider.user!.id,
                    contentTitle: kInstagram,
                    contentBody: instagram!,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const Text("More Info"),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Web Adress",
              value: userDetailProvider.userDetail?.web,
              onSaved: (web) async {
                await userDetailProvider.eitherUpdateUserDetailVoidOrFailure(
                  params: UpdateUserDetailParams(
                    userID: userProvider.user!.id,
                    contentTitle: kWeb,
                    contentBody: web!,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
