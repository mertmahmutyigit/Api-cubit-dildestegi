import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalConstants {
  static const trLocale = Locale("tr", "TR");
  static const enLocale = Locale("en", "US");
  static const localePath = "assets/lang";

  static String get profil => tr("Profil");
  static String get ayarlar => tr("Ayarlar");
  static String get temayiDegistir => tr("Temayı Değiştir");
  static String get kullaniciAdi => tr("Kullanıcı Adı");
  static String get cikis => tr("Cikis");
}

String getLocalizedText(String key) => tr(key);
