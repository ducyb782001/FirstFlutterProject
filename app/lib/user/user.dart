import 'dart:convert';

import 'package:collection/collection.dart';

import 'menu.dart';

class User {
  Menu? menu;

  User({this.menu});

  factory User.fromMap(Map<String, dynamic> data) => User(
        menu: data['menu'] == null
            ? null
            : Menu.fromMap(data['menu'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'menu': menu?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => menu.hashCode;
}
