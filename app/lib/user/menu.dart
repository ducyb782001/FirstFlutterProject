import 'dart:convert';

import 'package:collection/collection.dart';

import 'popup.dart';

class Menu {
  String? id;
  String? value;
  Popup? popup;

  Menu({this.id, this.value, this.popup});

  factory Menu.fromMap(Map<String, dynamic> data) => Menu(
        id: data['id'] as String?,
        value: data['value'] as String?,
        popup: data['popup'] == null
            ? null
            : Popup.fromMap(data['popup'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'value': value,
        'popup': popup?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Menu].
  factory Menu.fromJson(String data) {
    return Menu.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Menu] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Menu) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ value.hashCode ^ popup.hashCode;
}
