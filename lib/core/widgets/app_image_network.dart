import 'package:cached_network_image/cached_network_image.dart';
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
      child: CachedNetworkImage(
        imageUrl: widget.imageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, child, loadingProgress) {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.totalSize != null
                  ? loadingProgress.downloaded / loadingProgress.totalSize!
                  : null,
            ),
          );
        },
        errorWidget: (context, error, stackTrace) {
          return Icon(
            Icons.no_photography_sharp,
            color: Theme.of(context).primaryColorLight,
          );
        },
      ),
    );
  }
}
