import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String name;
  final String email;
  final String idToken;
  final bool notifications;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.idToken,
      required this.notifications});

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;

    if (userData != null) {
      return User(
          id: userDoc.id,
          name: userData['name'],
          email: userData['email'],
          idToken: userData['idToken'],
          notifications: userData['notifications']);
    } else {
      return User.initialUser();
    }
  }

  factory User.initialUser() {
    return User(id: '', name: '', email: '', idToken: '', notifications: false);
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, idToken: $idToken, notifications: $notifications)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'idToken': idToken,
      'notifications': notifications,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      idToken: map['idToken'] as String,
      notifications: map['notifications'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? idToken,
    bool? notifications,
  }) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        idToken: idToken ?? this.idToken,
        notifications: notifications ?? this.notifications);
  }
}
