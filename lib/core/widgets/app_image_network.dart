import 'package:flutter/material.dart';

class AppImageNetwork extends StatefulWidget {
  final String imageUrl;
  final double borderRadius;
  const AppImageNetwork({
    required this.imageUrl,
    super.key,
    this.borderRadius = 20,
  });

  @override
  State<AppImageNetwork> createState() => _AppImageNetworkState();
}

class _AppImageNetworkState extends State<AppImageNetwork> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(widget.borderRadius),
      child: Image.network(
        widget.imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.no_photography_sharp,
            color: Theme.of(context).primaryColorLight,
          );
        },
      ),
    );
  }
}
