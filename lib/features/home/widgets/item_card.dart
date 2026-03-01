import 'package:flutter/material.dart';

import 'package:greenmart/features/home/data/product_model.dart';

import '../../../core/functions/app_navigations.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_texts_styles.dart';
import '../../product_detail/page/product_detail_screen.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, ProductDetailScreen(model: model));
      },
      // hero animation for item card
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        // rounded corners with border and shadow
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.backgroundColor,
          border: Border.all(color: AppColors.accentColor),
          boxShadow: [
            BoxShadow(
              color: AppColors.accentColor,
              blurRadius: 4,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        // column with image, name, quantity for price and price with add button
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image with expanded to take all available space and center the image
            Expanded(child: Center(child: Image.network(model.image))),
            SizedBox(height: 10),
            // name with bold font weight and size of 16
            Text(
              model.name,
              style: AppTextsStyles.body.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              model.quantityForPrice,
              style: AppTextsStyles.caption2.copyWith(color: AppColors.greyColor),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '\$${model.price}',
                  style: AppTextsStyles.body.copyWith(fontWeight: FontWeight.w600),
                ),
                Spacer(),
                FloatingActionButton.small(
                  heroTag: UniqueKey(),
                  elevation: 0,
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.backgroundColor,
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}