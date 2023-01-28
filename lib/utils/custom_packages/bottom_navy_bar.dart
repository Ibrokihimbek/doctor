import 'package:doctor_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BottomNavyBar extends StatelessWidget {
  const BottomNavyBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 12,
    required this.bottomNavHeight,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;

  final double iconSize;

  final Color? backgroundColor;

  final bool showElevation;

  final Duration animationDuration;

  final List<BottomNavyBarItem> items;

  final ValueChanged<int> onItemSelected;

  final MainAxisAlignment mainAxisAlignment;

  final double itemCornerRadius;

  final double bottomNavHeight;

  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor =
        backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;

    return Container(
      width: double.infinity,
      height: bottomNavHeight,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          width: 1.w,
          color: MyColors.neutral8,
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.r),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 20.w),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: items.map((item) {
          var index = items.indexOf(item);
          return GestureDetector(
            onTap: () => onItemSelected(index),
            child: _ItemWidget(
              item: item,
              iconSize: iconSize.sp,
              isSelected: index == selectedIndex,
              backgroundColor: bgColor,
              itemCornerRadius: itemCornerRadius,
              animationDuration: animationDuration,
              curve: curve,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedSize(
        duration: animationDuration,
        curve: Curves.ease,
        child:Container(
          decoration: BoxDecoration(
            color: item.activeColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(itemCornerRadius),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              isSelected
                  ? IconTheme(
                data: IconThemeData(
                  size: iconSize,
                  color: isSelected
                      ? item.activeColor.withOpacity(1)
                      : item.inactiveColor ?? item.activeColor,
                ),
                child: item.icon,
              )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconTheme(
                        data: IconThemeData(
                          size: iconSize.sp,
                          color: isSelected
                              ? item.activeColor.withOpacity(1)
                              : item.inactiveColor ?? item.activeColor,
                        ),
                        child: item.icon,
                      ),
                    ],
                  ),
              if (isSelected)
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: DefaultTextStyle.merge(
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: item.activeColor,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      textAlign: item.textAlign,
                      child: item.title,
                    )),
            ],
          ),
        )
      ),
    );
  }
}

class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });

  final Widget icon;
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
}
