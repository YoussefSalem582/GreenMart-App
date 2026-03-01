import 'package:flutter/material.dart';
import 'package:greenmart/features/home/data/dummy_data.dart';
import 'package:greenmart/features/home/widgets/item_card.dart';

import '../../../core/styles/app_texts_styles.dart';

class AllProductsBuilder extends StatelessWidget {
  const AllProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('All Products', style: AppTextsStyles.title),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text('See all', style: AppTextsStyles.caption),
            ),
          ],
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            return ItemCard(model: allProducts[index]);
          },
          itemCount: allProducts.length,
        ),
      ],
    );
  }
}
