import 'package:flutter/material.dart';

class ProductsItem extends StatelessWidget {
  const ProductsItem({
    Key? key,
    required this.title,
    this.imageUrl,
    this.price,
  }) : super(key: key);

  final String title;
  final String? imageUrl;
  final int? price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (imageUrl != null) Image(image: NetworkImage(imageUrl!)),
        Container(
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (price != null)
                Text(
                  "$price₽",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
