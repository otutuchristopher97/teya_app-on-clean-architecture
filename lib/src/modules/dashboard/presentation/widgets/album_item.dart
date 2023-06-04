import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teya/src/core/components/texts/custom_text.dart';
import 'package:teya/src/modules/dashboard/data/models/album_feed.dart';
import 'package:teya/src/modules/dashboard/presentation/views/detail_screen.dart';

class AlbumItem extends StatelessWidget {
  final AlbumModel album;
  AlbumItem({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return DetailScreen(album: album,);
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return Align(
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
          ),
        );
      },
      child: Card(
        child: SizedBox(
          height: 100,
          child: Column(
            children: [
              Hero(
                tag: 'image22',
                child: Image.network(
                  album.imImage?[0].label ?? '',
                  height: 90,
                  filterQuality: FilterQuality.high,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              CustomText(
                text: album.title?.label ?? '',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
