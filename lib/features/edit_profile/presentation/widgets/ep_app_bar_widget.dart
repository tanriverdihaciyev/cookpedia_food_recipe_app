import '../../../../core/extensions/context_ext.dart';
import '../../../../core/params/user_params.dart';
import '../../../../core/resources/sizes.dart';
import '../states/ep_form_key_provider.dart';
import '../states/ep_loading_provider.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EPAppBarWidget extends StatelessWidget {
  const EPAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EPFormKeyProvider epFormKeyProvider = context.watch<EPFormKeyProvider>();
    EPLoadingProvider loadingProvider = context.watch<EPLoadingProvider>();
    return AppBar(
      title: const Text("Edit Profile"),
      actions: [
        IconButton(
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            await Future.delayed(const Duration(seconds: 1));
            if (epFormKeyProvider.formKey.currentState!.validate()) {
              epFormKeyProvider.formKey.currentState?.save();
              loadingProvider.changeLoading();
              await Future.delayed(const Duration(seconds: 10))
                  .then((value) async {
                await context
                    .read<UserProvider>()
                    .eitherGetUserOrFailure(
                      params:
                          UserParams(id: context.read<UserProvider>().user!.id),
                      userDetailProvider: context.read<UserDetailProvider>(),
                      recipeProvider: context.read<RecipeProvider>(),
                    )
                    .then((value) {
                  loadingProvider.changeLoading();

                  context.pop();
                });
              });
            }
          },
          icon: const Icon(Icons.done),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, context.height(Sizes.s0_1)),
        child: loadingProvider.loading
            ? const LinearProgressIndicator(
                color: Colors.red,
              )
            : const SizedBox(),
      ),
    );
  }
}
