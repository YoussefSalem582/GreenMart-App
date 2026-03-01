import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_texts_styles.dart';
import 'package:greenmart/features/home/data/dummy_data.dart';
import 'package:greenmart/features/home/widgets/item_card.dart';

class OffersBuilder extends StatelessWidget {
  const OffersBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Exclusive Offer', style: AppTextsStyles.title),
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
              return ItemCard(model: offers[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: offers.length,
          ),
        ),
      ],
    );
  }
}
