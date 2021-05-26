import 'package:flutter/material.dart';

enum SupportedLanguage { en, vi }

extension Transformer on SupportedLanguage {
  String toLanguageCode() {
    switch (this) {
      case SupportedLanguage.vi:
        {
          return "vi";
        }
      case SupportedLanguage.en:
        {
          return "en";
        }
    }
  }

  Locale toLocale() {
    return Locale(this.toLanguageCode());
  }
}
