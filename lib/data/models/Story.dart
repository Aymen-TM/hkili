import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Story {
  String? userId;
  String? userPhoto;
  String? storyId;
  String? userName;
  String? story;
  String? category;
  List<dynamic>? likes;
  List<dynamic>? dislikes;
  Story({
    this.userId,
    this.storyId,
    this.userName,
    this.story,
    this.category,
    this.likes,
    this.dislikes,
    this.userPhoto,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (userPhoto != null) {
      result.addAll({'userPhoto': userPhoto});
    }
    if (storyId != null) {
      result.addAll({'storyId': storyId});
    }
    if (userName != null) {
      result.addAll({'userName': userName});
    }
    if (story != null) {
      result.addAll({'story': story});
    }
    if (category != null) {
      result.addAll({'category': category});
    }
    if (likes != null) {
      result.addAll({'likes': likes});
    }
    if (dislikes != null) {
      result.addAll({'dislikes': dislikes});
    }

    return result;
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
        userId: map['userId'],
        storyId: map['storyId'],
        userName: map['userName'],
        story: map['story'],
        category: map['category'],
        likes: map['likes'],
        dislikes: map['dislikes'],
        userPhoto: map["userPhoto"]);
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source));

  factory Story.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    return Story(
        userId: data['userId'] ?? '',
        storyId: data['storyId'] ?? '',
        userName: data['userName'] ?? '',
        story: data['story'] ?? '',
        category: data['category'] ?? '',
        likes: data['likes'],
        dislikes: data['dislikes'],
        userPhoto: data['userPhoto'] ?? '');
  }
}
