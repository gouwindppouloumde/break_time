import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeData {
   SizeData({
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
  });

  factory SizeData.main() => SizeData(xs: 5, s: 10, m: 15, l: 20, xl: 30);

  final double xs;
  final double s;
  final double m;
  final double l;
  final double xl;

  ThemeEdgeInsetsSizeData get insets => ThemeEdgeInsetsSizeData(this);
}

class ThemeEdgeInsetsSizeData {
 ThemeEdgeInsetsSizeData(this._spacing);
  final SizeData _spacing;
  EdgeInsets get xs => EdgeInsets.all(_spacing.xs);
  EdgeInsets get s => EdgeInsets.all(_spacing.s);
  EdgeInsets get m => EdgeInsets.all(_spacing.m);
  EdgeInsets get l => EdgeInsets.all(_spacing.l);
  EdgeInsets get xl => EdgeInsets.all(_spacing.xl);
}
