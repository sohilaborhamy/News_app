import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_app/core/widgets/custom_text_field.dart';
import 'package:new_app/data/models/article_model.dart';

import '../../core/theme/colors_app.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Article> articles = [];
  int maxPage = 0;
  int currentPage = 1;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: SizedBox(),
            leadingWidth: 0,
            floating: true,
            toolbarHeight: 80,
            title: CustomTextField(
              hint: "Search",
              hintColor: ColorsApp.primaryColorLight,
              prefixIcon: const Icon(
                Icons.search,
                size: 24,
                color: ColorsApp.primaryColorLight,
              ),
              suffixWidget: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: ColorsApp.primaryColorLight),
              ),
            ),
          ),
          if (articles.isEmpty)
            SliverToBoxAdapter(
              child: Lottie.asset("assets/animation/animation_search.json"),
            ),
        ],
      ),
    );
  }
}
