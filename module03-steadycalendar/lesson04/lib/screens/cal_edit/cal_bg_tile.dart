import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/config/constants.dart';
import '/components/sc_list_tile.dart';

class CalBGTile extends StatelessWidget {
  final String backgroundSlug;
  final GestureTapCallback? onTap;

  const CalBGTile(this.backgroundSlug, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SCListTile('Background',
        trailing: SizedBox(
            width: 75.0,
            height: 50.0,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // FIXME make corners rounded
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        "${baseBackgroundImageURL(env['SUPABASE_PROJECT_ID']!)}/$backgroundSlug",
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ))
            ])),
        onTap: onTap);
  }
}
