import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/style.dart';

class ThemeSwitchButton extends StatefulWidget {
  const ThemeSwitchButton({super.key});

  @override
  State<ThemeSwitchButton> createState() => _ThemeSwitchButtonState();
}

class _ThemeSwitchButtonState extends State<ThemeSwitchButton> {
  AdaptiveThemeMode? themeMode;

  Future<void> _getMode() async {
    themeMode = await AdaptiveTheme.getThemeMode();
    setState(() {});
  }

  Future<void> _switchTheme() async {
    if (themeMode!.isDark) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
    await _getMode();
  }

  @override
  void initState() {
    _getMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
         AppIcons.logo,
        color: Theme.of(context).hintColor,
        height: 30,
      ),
      onTap: () async {
        await _switchTheme();
      },
      title: Text(
        tr('dark_mode'),
        style: MyTextStyle.sfProRegular.copyWith(fontSize: 17,color: Theme.of(context).cardColor),
      ),
      trailing: Switch.adaptive(
        activeColor: MyColors.primary,
        value: themeMode != null ? themeMode!.isDark : false,
        onChanged: (value) async {
          await _switchTheme();
        },
      ),
    );
  }
}
