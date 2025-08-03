import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:ui';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:wedding_invitation/widgets/imagePage.dart';

class Gallery extends StatefulWidget {
  final List<ImageProvider> imagePaths = [
    AssetImage('assets/images/photo/m01.JPG'),
    AssetImage('assets/images/photo/m02.JPG'),
    AssetImage('assets/images/photo/m03.JPG'),
    AssetImage('assets/images/photo/m04.JPG'),
    AssetImage('assets/images/photo/m05.JPG'),
    AssetImage('assets/images/photo/m06.JPG'),
    AssetImage('assets/images/photo/m07.JPG'),
    AssetImage('assets/images/photo/m08.JPG'),
    AssetImage('assets/images/photo/m09.JPG'),
    AssetImage('assets/images/photo/m10.JPG'),
    AssetImage('assets/images/photo/m11.JPG'),
    AssetImage('assets/images/photo/m12.JPG'),
    AssetImage('assets/images/photo/m13.JPG'),
    AssetImage('assets/images/photo/m14.JPG'),
    AssetImage('assets/images/photo/m15.JPG'),
    AssetImage('assets/images/photo/m16.JPG'),
    AssetImage('assets/images/photo/m17.JPG'),
    AssetImage('assets/images/photo/m18.jpg'),
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
    return Center(
      child: Container(
        width: 500.0,
        margin: const EdgeInsetsDirectional.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: const AutoSizeText(
                '갤러리',
                style: TextStyle(
                  color: Color.fromRGBO(41, 82, 56, 100),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
          
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
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
                child: Image(
                  image: widget.imagePaths[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
