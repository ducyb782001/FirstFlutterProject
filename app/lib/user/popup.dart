import 'dart:convert';

import 'package:collection/collection.dart';

import 'menuitem.dart';

class Popup {
  List<Menuitem>? menuitem;

  Popup({this.menuitem});

  factory Popup.fromMap(Map<String, dynamic> data) => Popup(
        menuitem: (data['menuitem'] as List<dynamic>?)
            ?.map((e) => Menuitem.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'menuitem': menuitem?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Popup].
  factory Popup.fromJson(String data) {
    return Popup.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Popup] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Popup) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => menuitem.hashCode;
}
