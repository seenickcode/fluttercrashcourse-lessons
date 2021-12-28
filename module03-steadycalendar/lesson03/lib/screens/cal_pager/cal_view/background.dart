import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/config/constants.dart';

class Background extends StatelessWidget {
  final String? backgroundSlug;

  const Background(this.backgroundSlug, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FIXME if imageUrl value gets broken, app will crash b/c of how Flutter decides to handle
    // broken image URLs. make more resilient.
    return Expanded(
        child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl:
          "${baseBackgroundImageURL(env['SUPABASE_PROJECT_ID']!)}/$backgroundSlug",
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ));
  }
}