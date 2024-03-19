import 'dart:developer';
import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/comments.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost({
    required String description,
    required Uint8List file,
    required String uid,
    required String username,
    required String profileImage,
  }) async {
    String res = 'Some error occurred';
    try {
      String photoUrl = await StorageMethods()
          .uploadImageToStorage(childName: 'posts', file: file, isPost: true);
      String postId = const Uuid().v1();

      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrls: photoUrl,
        profileImage: profileImage,
        likes: [],
      );

      await _firestore.collection('posts').doc(postId).set(post.toMap());
      res = 'Success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      //3.
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> postComment(
      {required String postId,
      required String comment,
      required String uid,
      required String name,
      required String profilePic}) async {
    try {
      if (comment.isNotEmpty) {
        String commentId = const Uuid().v1();
        Comments comments = Comments(
            commentId: commentId,
            name: name,
            uid: uid,
            comment: comment,
            profilePic: profilePic,
            dateTime: DateTime.now(),
            like: [],
            postId: postId);

        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set(comments.toMap());
      } else {
        log('Text is Empty');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> likeComment({
    required String postId,
    required String uid,
    required String commentId,
    required List likes,
  }) async {
    try {
      //3.
      if (likes.contains(uid)) {
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .update({
          'like': FieldValue.arrayRemove([uid]),
        });
      } else {
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .update({
          'like': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
