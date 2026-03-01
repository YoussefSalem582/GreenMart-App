import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/widgets/app_button.dart';
import 'package:greenmart/features/home/data/product_model.dart';

import '../../../core/styles/app_texts_styles.dart';
import '../widgets/checkout_bottom_sheet.dart';
import '../widgets/price_with_counter.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(30),
              // hero animation for image with tag of model
              child: Hero(tag: model, child: Image.network(model.image)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(model.name, style: AppTextsStyles.subtitle),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(model.quantityForPrice.toString()),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      icon: Icon(Icons.favorite_border),
                    ),
                  ),
                  SizedBox(height: 20),
                  PriceWithCounter(model: model),
                  SizedBox(height: 20),
                  Divider(),
                  ExpansionTile(
                    title: Text(
                      'Product Detail',
                      style: AppTextsStyles.subtitle,
                    ),
                    childrenPadding: EdgeInsets.zero,
                    tilePadding: EdgeInsets.zero,
                    children: [
                      Text(
                        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                        style: AppTextsStyles.caption.copyWith(
                          color: AppColors.textSubtitleColor,
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 30),
                  Row(
                    children: [
                      Text('Reviews', style: AppTextsStyles.subtitle),
                      Spacer(),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 24,
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (rating) {},
                      ),
                      Icon(Icons.chevron_right_rounded, size: 30),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: AppButton(
          text: 'Add to Cart',
          onPressed: () {
            showCheckoutBottomSheet(context);
          },
        ),
      ),
    );
  }
}
