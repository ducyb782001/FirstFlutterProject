import 'dart:convert';

import 'package:collection/collection.dart';

class Menuitem {
  String? value;
  String? onclick;

  Menuitem({this.value, this.onclick});

  factory Menuitem.fromMap(Map<String, dynamic> data) => Menuitem(
        value: data['value'] as String?,
        onclick: data['onclick'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'value': value,
        'onclick': onclick,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Menuitem].
  factory Menuitem.fromJson(String data) {
    return Menuitem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Menuitem] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Menuitem) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => value.hashCode ^ onclick.hashCode;
}
