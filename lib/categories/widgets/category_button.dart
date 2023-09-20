import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.imageUrl,
  });

  final String label;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 115,
            errorBuilder: (context, exception, trace) {
              return Image.network("http://via.placeholder.com/350x350");
            },
          ),
          Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );

    // return GridTile(
    //   footer: Padding(
    //     padding: const EdgeInsets.only(top: 100),
    //     child: Text(label.trim()),
    //   ),
    //   child: Image.network(imageUrl, errorBuilder: (context, exception, trace) {
    //     return Image.network("http://via.placeholder.com/350x350");
    //   }),
    // );

    // return InkWell(
    //   onTap: onTap,
    //   borderRadius: BorderRadius.circular(20),
    //   child: Ink(
    //     width: 130,
    //     // height: 300,
    //     padding: const EdgeInsets.all(20),
    //     decoration: BoxDecoration(
    //       image: imageUrl != null
    //           ? DecorationImage(
    //               image: NetworkImage(imageUrl!),
    //               alignment: AlignmentDirectional.bottomEnd,
    //               scale: 0.5,
    //             )
    //           : null,
    //       borderRadius: BorderRadius.circular(20),
    //       color: Colors.grey.shade100,
    //     ),
    //     child: Text(
    //       label.toUpperCase().trim(),
    //       style: const TextStyle(
    //         fontWeight: FontWeight.bold,
    //         fontSize: 12,
    //         shadows: [
    //           Shadow(
    //             color: Colors.black,
    //             offset: Offset(0, 2.0),
    //             blurRadius: 16.0,
    //           ),
    //         ],
    //         color: Color(0xFFFFFFFF),
    //       ),
    //     ),
    //   ),
    // );
  }
}
