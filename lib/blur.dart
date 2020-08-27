import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBuilder extends StatelessWidget {
  final bool isVisible;
  final Widget child;
  final double sigmaX;
  final double sigmaY;

  BlurBuilder({
    this.isVisible,
    this.child,
    this.sigmaX = 5,
    this.sigmaY = 5,
  });

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Stack(
            fit: StackFit.expand,
            children: <Widget>[
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: sigmaX,
                  sigmaY: sigmaY,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              child,
            ],
          )
        : child;
  }
}
