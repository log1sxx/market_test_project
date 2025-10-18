import 'package:flutter/material.dart';
import 'package:market_test_project/gen/l10n.dart';

extension LocalizationExtension on BuildContext {
  S get l10n => S.of(this);
}
