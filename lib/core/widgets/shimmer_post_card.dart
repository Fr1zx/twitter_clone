import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPostCard extends StatelessWidget {
  const ShimmerPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget shimmerBox({
      double height = 16,
      double width = double.infinity,
      BorderRadius? radius,
    }) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius ?? BorderRadius.circular(4),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.all(15).copyWith(bottom: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundColor: Colors.white, radius: 20),
                const SizedBox(width: 10),
                shimmerBox(height: 16, width: 100),
              ],
            ),
            const SizedBox(height: 20),
            shimmerBox(height: 20, width: 200),
            const SizedBox(height: 10),
            shimmerBox(height: 14, width: double.infinity),
            const SizedBox(height: 5),
            shimmerBox(height: 14, width: double.infinity),
            const SizedBox(height: 5),
            shimmerBox(height: 14, width: 150),
            const SizedBox(height: 25),
            shimmerBox(height: 14, width: 80),
          ],
        ),
      ),
    );
  }
}
