import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f3_intro/image/image_picsum.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageSamplesView extends StatefulWidget {
  const ImageSamplesView({Key? key}) : super(key: key);

  @override
  State<ImageSamplesView> createState() => _ImageSamplesViewState();
}

class _ImageSamplesViewState extends State<ImageSamplesView> {
  final _baseUrl = 'https://picsum.photos/v2/list?page=2&limit=100';
  List<ImagePicsum> _items = [];

  @override
  void initState() {
    super.initState();
    fetchimages();
  }

  Future<void> fetchimages() async {
    final response = await Dio().get(_baseUrl);

    if (response.statusCode == HttpStatus.ok) {
      setState(() {
        _items = (response.data as List).map((e) => ImagePicsum.fromJson(e)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          itemCount: _items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Image.network(
              _items[index].downloadUrl ?? '',
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return child;
                }
              },
            );
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: _items[index].downloadUrl ?? '',
              ),
            );
          }),
    );
  }
}
