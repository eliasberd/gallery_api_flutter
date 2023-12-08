import 'dart:ui';

import 'package:flutter/material.dart';


class ViewImage extends StatelessWidget{
  final String url;

  ViewImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
        child: Image.network(
          url,
          fit: BoxFit.contain,
        ),
      )

    );
  }

}