import 'dart:convert';

class Story {
  String? userId;
  String? storyId;
  String? userName;
  String? story;
  String? category;
  int? likes;
  int? dislikes;
  Story({
    this.userId,
    this.storyId,
    this.userName,
    this.story,
    this.category,
    this.likes,
    this.dislikes,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (userId != null) {
      result.addAll({'userId': userId});
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
      likes: map['likes']?.toInt(),
      dislikes: map['dislikes']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source));
}
