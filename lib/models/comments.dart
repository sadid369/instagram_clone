import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Comments {
  final String commentId;
  final String postId;
  final String name;
  final String uid;
  final String comment;
  final String profilePic;
  final List like;
  final DateTime dateTime;
  Comments({
    required this.commentId,
    required this.postId,
    required this.name,
    required this.uid,
    required this.comment,
    required this.profilePic,
    required this.like,
    required this.dateTime,
  });

  Comments copyWith({
    String? commentId,
    String? postId,
    String? name,
    String? uid,
    String? comment,
    String? profilePic,
    List? like,
    DateTime? dateTime,
  }) {
    return Comments(
      commentId: commentId ?? this.commentId,
      postId: postId ?? this.postId,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      comment: comment ?? this.comment,
      profilePic: profilePic ?? this.profilePic,
      like: like ?? this.like,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commentId': commentId,
      'postId': postId,
      'name': name,
      'uid': uid,
      'comment': comment,
      'profilePic': profilePic,
      'like': like,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory Comments.fromMap(Map<String, dynamic> map) {
    return Comments(
      commentId: map['commentId'] as String,
      postId: map['postId'] as String,
      name: map['name'] as String,
      uid: map['uid'] as String,
      comment: map['comment'] as String,
      profilePic: map['profilePic'] as String,
      like: List.from((map['like'] as List)),
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comments.fromJson(String source) =>
      Comments.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Comments(commentId: $commentId, postId: $postId, name: $name, uid: $uid, comment: $comment, profilePic: $profilePic, like: $like, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant Comments other) {
    if (identical(this, other)) return true;

    return other.commentId == commentId &&
        other.postId == postId &&
        other.name == name &&
        other.uid == uid &&
        other.comment == comment &&
        other.profilePic == profilePic &&
        listEquals(other.like, like) &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return commentId.hashCode ^
        postId.hashCode ^
        name.hashCode ^
        uid.hashCode ^
        comment.hashCode ^
        profilePic.hashCode ^
        like.hashCode ^
        dateTime.hashCode;
  }
}
