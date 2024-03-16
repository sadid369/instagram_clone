import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final dynamic datePublished;
  final String postUrls;
  final String profileImage;
  final dynamic likes;
  Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrls,
    required this.profileImage,
    required this.likes,
  });

  Post copyWith({
    String? description,
    String? uid,
    String? username,
    String? postId,
    dynamic? datePublished,
    String? postUrls,
    String? profileImage,
    dynamic? likes,
  }) {
    return Post(
      description: description ?? this.description,
      uid: uid ?? this.uid,
      username: username ?? this.username,
      postId: postId ?? this.postId,
      datePublished: datePublished ?? this.datePublished,
      postUrls: postUrls ?? this.postUrls,
      profileImage: profileImage ?? this.profileImage,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'uid': uid,
      'username': username,
      'postId': postId,
      'datePublished': datePublished,
      'postUrls': postUrls,
      'profileImage': profileImage,
      'likes': likes,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      description: map['description'] as String,
      uid: map['uid'] as String,
      username: map['username'] as String,
      postId: map['postId'] as String,
      datePublished: map['datePublished'] as dynamic,
      postUrls: map['postUrls'] as String,
      profileImage: map['profileImage'] as String,
      likes: map['likes'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(description: $description, uid: $uid, username: $username, postId: $postId, datePublished: $datePublished, postUrls: $postUrls, profileImage: $profileImage, likes: $likes)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.description == description &&
        other.uid == uid &&
        other.username == username &&
        other.postId == postId &&
        other.datePublished == datePublished &&
        other.postUrls == postUrls &&
        other.profileImage == profileImage &&
        other.likes == likes;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        uid.hashCode ^
        username.hashCode ^
        postId.hashCode ^
        datePublished.hashCode ^
        postUrls.hashCode ^
        profileImage.hashCode ^
        likes.hashCode;
  }
}
