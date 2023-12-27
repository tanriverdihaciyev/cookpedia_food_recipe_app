import '../../../../core/companents/widgets/app_loading_widget.dart';
import '../states/cr_download_waiting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/cr_form_key_provider.dart';
import 'cr_cook_time_widget.dart';
import 'cr_covers_list_view_widget.dart';
import 'cr_description_widget.dart';
import 'cr_divider_widget.dart';
import 'cr_origin_widget.dart';
import 'cr_serves_widget.dart';
import 'cr_sized_box_10.dart';
import 'ingredients/cr_add_ingredients_widget.dart';
import 'ingredients/cr_ingredients_tiles_view_widget.dart';
import 'ingredients/cr_ingredients_widget.dart';
import 'instruction/cr_add_instruction_widget.dart';
import 'instruction/cr_instruction_view_widget.dart';
import 'instruction/cr_instruction_widget.dart';
import 'titles/cr_title_widget.dart';

List<Widget> bodyWidgets = const [
  CRCoversListView(),
  CRSizedBox10(),
  CRTitleWidget(),
  CRSizedBox10(),
  CRDescriptionWidget(),
  CRSizedBox10(),
  CRCookTimeWidget(),
  CRSizedBox10(),
  CRServesWidget(),
  CRSizedBox10(),
  CROriginWidget(),
  CRSizedBox10(),
  CRDividerWidget(),
  CRSizedBox10(),
  CRIngredientsWidget(),
  CRSizedBox10(),
  CRIngredientsTilesViewWidget(),
  CRAddIngredientsWidget(),
  CRSizedBox10(),
  CRDividerWidget(),
  CRSizedBox10(),
  CRInstructionsWidget(),
  CRSizedBox10(),
  CRInstructionViewWidget(),
  CRSizedBox10(),
  CRAddInstructionWidget(),
  CRSizedBox10(),
];

class CRBodyWidget extends StatelessWidget {
  const CRBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: context.watch<CRFormKeyProvider>().formKey,
          child: ListView(
            children: bodyWidgets,
          ),
        ),
        if (context.watch<CRDownloadWaitingProvider>().isDownloading)
          const Center(child: AppLoadingWidget()),
      ],
    );
  }
}
