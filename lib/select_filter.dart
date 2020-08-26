import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:select_filter/blur.dart';

class SelectFilterBuilder extends StatelessWidget {
  final Function(int) onChange;
  final List selectList;
  final IndexedWidgetBuilder itemBuilder;
  final Color activeItemColor;
  final Color closeItemColor;
  final Color passiveItemColor;
  final double activeItemSize;
  final double closeItemSize;
  final double passiveItemSize;
  final FontWeight activeItemWeight;
  final FontWeight closeItemWeight;
  final FontWeight passiveItemWeight;
  final Color bgColor;
  final double itemWidth;
  final double itemHeight;
  final bool hasBgBlur;
  final bool hasLoop;
  final double blurX;
  final double blurY;
  int selectedIndex;

  SelectFilterBuilder({
    this.onChange,
    this.selectList,
    this.selectedIndex = 0,
    this.activeItemColor = const Color(0xFFBFFFD5),
    this.closeItemColor = const Color.fromRGBO(0xBF, 0xFF, 0xD5, .7),
    this.passiveItemColor = const Color.fromRGBO(0xBF, 0xFF, 0xD5, .4),
    this.activeItemSize = 35,
    this.closeItemSize = 23,
    this.passiveItemSize = 18,
    this.activeItemWeight = FontWeight.bold,
    this.closeItemWeight = FontWeight.w500,
    this.passiveItemWeight = FontWeight.w300,
    this.bgColor = Colors.black54,
    this.itemWidth,
    this.itemHeight,
    this.itemBuilder,
    this.hasBgBlur = true,
    this.hasLoop = false,
    this.blurX = 5,
    this.blurY = 5,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Material(
        color: bgColor,
        child: BlurBuilder(
          sigmaX: blurX,
          sigmaY: blurY,
          isVisible: hasBgBlur,
          child: Center(
            child: Container(
              width: itemWidth ?? size.width,
              height: itemHeight ?? size.height,
              child: new Swiper(
                itemBuilder: itemBuilder ??
                    (BuildContext context, int index) {
                      return Center(
                        child: Text(
                          selectList[index],
                          style: TextStyle(
                            color: getColor(index),
                            fontSize: getFontSize(index),
                            fontWeight: getFontWeight(index),
                          ),
                        ),
                      );
                    },
                onIndexChanged: (index) => selectedIndex = index,
                scrollDirection: Axis.vertical,
                itemCount: selectList.length,
                viewportFraction: 0.1,
                loop: hasLoop,
                index: selectedIndex ?? 0,
                onTap: (index) {
                  onChange(index);
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  double getFontSize(int index) {
    if (selectedIndex == index) {
      return activeItemSize;
    }
    if (selectedIndex + 1 == index || selectedIndex - 1 == index) {
      return closeItemSize;
    }
    return passiveItemSize;
  }

  Color getColor(int index) {
    if (selectedIndex == index) {
      return activeItemColor;
    }
    if (selectedIndex + 1 == index || selectedIndex - 1 == index) {
      return closeItemColor;
    }
    return passiveItemColor;
  }

  FontWeight getFontWeight(int index) {
    if (selectedIndex == index) {
      return activeItemWeight;
    }
    if (selectedIndex + 1 == index || selectedIndex - 1 == index) {
      return closeItemWeight;
    }
    return passiveItemWeight;
  }
}
