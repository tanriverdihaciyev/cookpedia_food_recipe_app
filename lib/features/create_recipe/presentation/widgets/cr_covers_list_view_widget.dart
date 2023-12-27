import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../states/cr_cover_image_provider.dart';
import 'cr_add_recipe_cover_widget.dart';
import 'cr_view_cover_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CRCoversListView extends StatelessWidget {
  const CRCoversListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CRCoverImageProvider coverImageProvider =
        context.watch<CRCoverImageProvider>();
    return SizedBox(
      height: context.width(Sizes.s0_9),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: coverImageProvider.covers.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return coverImageProvider.isCover(index)
              ? const CRAddRecipeCoverWidget()
              : CRViewCoverFormWidget(
                  index: index,
                );
        },
      ),
    );
  }
}
