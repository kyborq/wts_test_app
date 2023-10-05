import 'package:flutter/material.dart';
import 'package:wts_test_app/core/widgets/network_image_fallback.dart';
import 'package:wts_test_app/products/models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
        child: NetworkImageFallback(imageUrl: product.imageUrl),
      ),
    );
  }
}
