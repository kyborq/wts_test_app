import 'package:flutter/material.dart';

class NetworkImageFallback extends StatelessWidget {
  const NetworkImageFallback({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/fallback_image.png',
          width: width,
          height: height,
        );
      },
    );
  }
}
