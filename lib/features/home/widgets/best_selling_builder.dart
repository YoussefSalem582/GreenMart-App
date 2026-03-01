import 'package:flutter/material.dart';
import 'package:greenmart/features/home/data/dummy_data.dart';
import 'package:greenmart/features/home/widgets/item_card.dart';

import '../../../core/styles/app_texts_styles.dart';

class BestSellingBuilder extends StatelessWidget {
  const BestSellingBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Best Selling', style: AppTextsStyles.title),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text('See all', style: AppTextsStyles.caption),
            ),
          ],
        ),
        SizedBox(
          height: 230,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ItemCard(model: bestSelling[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: bestSelling.length,
          ),
        ),
      ],
    );
  }
}
