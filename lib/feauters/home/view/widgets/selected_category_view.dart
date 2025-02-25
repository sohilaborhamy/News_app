import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/extensions/extensions.dart';
import 'package:new_app/data/models/article_model.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/colors_app.dart';
import '../../../../data/models/category_model.dart';
import '../../view_model/home_view_model.dart';

class SelectedCategoryView extends StatefulWidget {
  final CategoryDataModel selectedCategoryModel;
  

  const SelectedCategoryView({
    super.key,
    required this.selectedCategoryModel,
  });

  @override
  State<SelectedCategoryView> createState() => _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = Provider.of<HomeViewModel>(context, listen: false);
    Future.wait([
      _viewModel.getAllSources(),
    ]).then(
      (value) {
        if (value[0]) {
          _viewModel.getAllArticles();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        DefaultTabController(
          length: _viewModel.sourcesList.length,
          child: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorPadding: EdgeInsets.zero,
            labelPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            tabs: _viewModel.sourcesList
                .map((e) => Text(
                      e.name,
                      style: theme.textTheme.bodyMedium?.copyWith(
                             fontWeight: FontWeight.bold,
                             
                                ),
                    ))
                .toList(),
            onTap: _viewModel.setSelectedSource,
          ),
        ),
        Expanded(
          child: Skeletonizer(
            enabled: _viewModel.articlesList.isEmpty,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) => InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {
                  _showArticleDetailsBottomSheet(
                      context, _viewModel.articlesList[index]);
                },
                child: Container(
                  width: 320,
                  height: 360,
                  child: CachedNetworkImage(
                    imageUrl: _viewModel.articlesList[index].urlToImage,
                    imageBuilder: (context, imageProvider) => Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.red,
                                    BlendMode.colorBurn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _viewModel.articlesList[index].title,
                            style: theme.textTheme.titleMedium?.copyWith(
                                height: 1.2, fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _viewModel.articlesList[index].author,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    height: 1.2,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFA0A0A0),
                                  ),
                                ),
                              ),
                              Text(
                                _viewModel.articlesList[index].publishedAt,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  height: 1.2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFA0A0A0),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: const CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.grey,
                      size: 60,
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: _viewModel.articlesList.length,
            ).setHorizontalPadding(context, 0.035),
          ),
        )
      ],
    );
  }

  void _showArticleDetailsBottomSheet(BuildContext context, Article article) {
    var theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: ColorsApp.primaryColorLight,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.grey,
                      size: 60,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  article.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                    color: ColorsApp.backgroundColorLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    
                    launchUrl(Uri.parse(article.url ?? ""),
                    mode: LaunchMode.inAppWebView);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: ColorsApp.backgroundColorLight,
                    foregroundColor: ColorsApp.primaryColorLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(16),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("View Fill Article"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
