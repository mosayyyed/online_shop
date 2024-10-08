import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../helper/product_api_helper.dart';
import '../../models/product_model.dart';
import '../../widgets/home/banner_list_view.dart';
import '../../widgets/home/categroy_list.dart';
import '../../widgets/home/product_grid_view.dart';
import '../../widgets/home/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<ProductModel>> fetchProduct() async {
    final result = await ProductApiHelper(Dio()).fetchProducts();
    return (result.data as List)
        .map((item) => ProductModel.fromJson(item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          // CustomSearchBar(),
          BannerListView(),
          SectionHeader(
            title: 'Category',
            seeMore: 'See More',
          ),
          CategoryList(),
          SectionHeader(
            title: 'Popular Products',
            seeMore: 'See More',
          ),
          ProductGridView(),
        ],
      ),
    );
  }
}
