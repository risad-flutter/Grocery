import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../common_widgets/app_text.dart';
import '../models/category_item.dart';
import '../widgets/category_item_card_widget.dart';
import '../widgets/search_bar_widget.dart';
import 'category_items_screen.dart';

List<Color> gridColors = [
  const Color(0xff53B175),
  const Color(0xffF8A44C),
  const Color(0xffF7A593),
  const Color(0xffD3B0E0),
  const Color(0xffFDE598),
  const Color(0xffB7DFF5),
  const Color(0xff836AF6),
  const Color(0xffD73B77),
];

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          getHeader(),
          Expanded(
            child: getStaggeredGridView(context),
          ),
        ],
      ),
    ));
  }

  Widget getHeader() {
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        Center(
          child: AppText(
            text: "Find Products",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SearchBarWidget(),
        ),
      ],
    );
  }

  Widget getStaggeredGridView(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,

      mainAxisSpacing: 3.0,
      crossAxisSpacing: 4.0,
      children: categoryItemsDemo.asMap().entries.map<Widget>((e) {
        int index = e.key;
        CategoryItem categoryItem = e.value;
        return GestureDetector(
          onTap: () {
            onCategoryItemClicked(context, categoryItem);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: CategoryItemCardWidget(
              item: categoryItem,
              color: gridColors[index % gridColors.length],
            ),
          ),
        );
      }).toList(), // add some space
    );
  }

  void onCategoryItemClicked(BuildContext context, CategoryItem categoryItem) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return const CategoryItemsScreen();
      },
    ));
  }
}
