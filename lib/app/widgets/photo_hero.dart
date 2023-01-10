import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/pallete.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {Key? key, required this.photo, required this.onTap, required this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return Hero(
      tag: photo,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: CircleAvatar(width: width, photo: photo),
        ),
      ),
    );
  }
}

class CircleAvatar extends StatelessWidget {
  const CircleAvatar({
    Key? key,
    required this.width,
    required this.photo,
  }) : super(key: key);

  final double width;
  final String photo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: CachedNetworkImage(
        imageUrl: photo,
        imageBuilder: (context, imageProvider) => Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            border: Border.all(color: Palette.black, width: 1.0),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // progressIndicatorBuilder: (context, url, progress) => Container(
        //     width: width,
        //     height: width,
        //     decoration: BoxDecoration(
        //       color: Palette.white,
        //       shape: BoxShape.circle,
        //     ),
        //     child: Center(
        //         child: Icon(
        //       Icons.person,
        //       color: Palette.black,
        //     ))),
        placeholder: (context, url) => Container(
            width: width,
            height: width,
            decoration: BoxDecoration(
              color: Palette.white,
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(Icons.person))),
        errorWidget: (context, url, error) => Container(
            width: width,
            height: width,
            decoration: BoxDecoration(
              color: Palette.white,
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(Icons.error))),
      ),
    );
  }
}
