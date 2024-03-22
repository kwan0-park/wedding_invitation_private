import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:ui';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:wedding_invitation/widgets/imagePage.dart';

class Gallery extends StatefulWidget {
  final List<ImageProvider> imagePaths = [
    //AssetImage('assets/images/white_0.JPG'),
    AssetImage('assets/images/white_1.jpg'),
    AssetImage('assets/images/white_2.JPG'),
    AssetImage('assets/images/white_3.JPG'),
    //AssetImage('assets/images/white_4.JPG'),
    AssetImage('assets/images/white_5.JPG'),
    AssetImage('assets/images/white_6.JPG'),
    AssetImage('assets/images/white_7.JPG'),
    AssetImage('assets/images/green_0.JPG'),
    AssetImage('assets/images/green_1.JPG'),
    AssetImage('assets/images/green_2.JPG'),
    AssetImage('assets/images/green_3.JPG'),
    AssetImage('assets/images/green_4.JPG'),
    AssetImage('assets/images/blue_0.JPG'),
    AssetImage('assets/images/blue_1.JPG'),
    AssetImage('assets/images/blue_2.JPG'),
    AssetImage('assets/images/blue_3.jpg'),
    AssetImage('assets/images/blue_4.JPG'),
    AssetImage('assets/images/blue_5.JPG'),
    AssetImage('assets/images/blue_6.jpg'),
  ];
  
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      margin: const EdgeInsetsDirectional.all(20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 한 행에 표시할 썸네일 수
        ),
        itemCount: widget.imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => ImagePage(
                    initialIndex: index,
                    imageProviders: widget.imagePaths,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(4.0),
              child: Image(
                image: widget.imagePaths[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
