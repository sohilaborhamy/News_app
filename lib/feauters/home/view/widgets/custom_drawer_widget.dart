import 'package:flutter/material.dart';

import '../../../../core/constants/assets_app.dart';
import '../../../../core/theme/colors_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';
import '../../../../providers/app_language_provider.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../view_model/home_view_model.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewModel>(context);
    List<String> _languageList = [
      AppLocalizations.of(context)!.arabic,
      AppLocalizations.of(context)!.english,
    ];
    List<String> _themeList = [
      AppLocalizations.of(context)!.dark,
      AppLocalizations.of(context)!.light,
    ];

    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var size = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Container(
      width: size.size.width*0.8,
       color: Colors.black,
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: size.size.height * 0.3,
          color: ColorsApp.backgroundColorLight,
          child: Text(
            "News App",
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        GestureDetector(
          onTap: () {
            navigatorKey.currentState!.pop();
            provider.goToHome();
          },
          child: Row(
            children: [
              Image.asset(
                AssetsApp.homeIcon,
                height: 30,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Go To Home",
                style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
          color: Colors.white,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Image.asset(
              AssetsApp.themeIcon,
              height: 35,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Theme",
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 280,
          height: 60,
          child: CustomDropdown<String>(
            hintText: themeProvider.isDark() == "dark"
                ? AppLocalizations.of(context)!.dark
                : AppLocalizations.of(context)!.light,
            items: _themeList,
            onChanged: (value) {
              if (value == "Dark") {
                themeProvider.changeTheme(ThemeMode.dark);
              } else if (value == "Light") {
                themeProvider.changeTheme(ThemeMode.light);
              }
            },
            decoration: CustomDropdownDecoration(
              expandedFillColor: ColorsApp.primaryColorLight,
              closedBorder: Border.all(color: Colors.white, width: 2),
              listItemStyle: const TextStyle(color: Colors.white, fontSize: 16),
              closedFillColor: Colors.transparent,
              headerStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              closedBorderRadius: BorderRadius.circular(18),
              closedSuffixIcon: const Icon(
                Icons.arrow_drop_down_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
          color: Colors.white,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Image.asset(
              AssetsApp.languageIcon,
              height: 35,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Language",
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 280,
          height: 60,
          child: CustomDropdown<String>(
            hintText: languageProvider.appLanguage == "en"
                ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic,
            items: _languageList,
            onChanged: (value) {
              if (value == AppLocalizations.of(context)!.english) {
                languageProvider.changeLanguage("en");
              } else if (value == AppLocalizations.of(context)!.arabic) {
                languageProvider.changeLanguage("ar");
              }
            },
            decoration: CustomDropdownDecoration(
              expandedFillColor: ColorsApp.primaryColorLight,
              closedBorder: Border.all(color: Colors.white, width: 2),
              listItemStyle: const TextStyle(color: Colors.white, fontSize: 16),
              closedFillColor: Colors.transparent,
              headerStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              closedBorderRadius: BorderRadius.circular(18),
              closedSuffixIcon: const Icon(
                Icons.arrow_drop_down_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
