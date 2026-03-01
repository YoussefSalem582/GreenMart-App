import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/app_images.dart';
import 'package:greenmart/core/widgets/app_text_form_field.dart';
import 'package:greenmart/core/widgets/custom_svg_picture.dart';
import 'package:greenmart/features/home/widgets/all_products_builder.dart';
import 'package:greenmart/features/home/widgets/best_selling_builder.dart';
import 'package:greenmart/features/home/widgets/offers_builder.dart';

import '../../../core/functions/app_navigations.dart';
import '../../../core/styles/app_colors.dart';
import '../../search/page/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomSvgPicture(
          path: AppImages.fullLogoSvg,
          color: AppColors.primaryColor,
          height: 42,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              GestureDetector(
                onTap: () {
                  pushTo(context, SearchScreen());
                },
                // hero animation for search field
                child: Hero(
                  tag: 'search',
                  child: Material(
                    child: AppTextFormField(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search for products',
                      enabled: false,
                      // onTap: () {
                      //   //pushTo(context, SearchScreen());
                      // },
                    ),
                  ),
                ),
              ),
              OffersBuilder(),
              BestSellingBuilder(),
              AllProductsBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
