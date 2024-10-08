import 'package:flutter/material.dart';

class BannerListView extends StatefulWidget {
  const BannerListView({super.key});

  @override
  _BannerListViewState createState() => _BannerListViewState();
}

class _BannerListViewState extends State<BannerListView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    Future.delayed(const Duration(seconds: 2), _autoScroll);
  }

  void _autoScroll() {
    _currentPage = (_currentPage + 1) % 3;
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(
          milliseconds: 800),
      curve: Curves.easeInOut,
    );

    Future.delayed(
        const Duration(seconds: 3), _autoScroll);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/banners_images/banner${index + 1}.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
