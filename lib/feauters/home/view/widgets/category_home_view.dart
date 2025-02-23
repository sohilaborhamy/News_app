import 'package:flutter/material.dart';
import 'package:new_app/core/extensions/extensions.dart';

import '../../../../data/models/category_model.dart';

class CategoryHomeView extends StatelessWidget {

  final List<CategoryDataModel> categoriesList;
  final void Function(CategoryDataModel) onCategoryClicked;

  const CategoryHomeView({
    super.key,
    required this.categoriesList,
    required this.onCategoryClicked,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning \nHere is Some News For You",
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Stack(
              alignment:
                  index % 2 == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
              children: [
                Image.asset(categoriesList[index].categoryImg),
                GestureDetector(
                  onTap: () {
                    onCategoryClicked(categoriesList[index]);
                  },
                  child: Container(
                    height: 55,
                    width: 170,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(85),
                    ),
                    child: Directionality(
                      textDirection: index % 2 == 0
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            "View All",
                            style: theme.textTheme.headlineSmall,
                          ),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_forward_ios),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: categoriesList.length,
          )
        ],
      ).setHorizontalAndVerticalPadding(context, 0.035, 0.015),
    );
  }
}