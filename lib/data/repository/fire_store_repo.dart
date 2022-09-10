import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hkili/data/models/Story.dart';

abstract class FireStoreRepository {
  Stream<QuerySnapshot> getAllStories();
  Future<List<Story>> getUserStories(String uid);
  Future<List<Story>> getStoriesByCategory(String category);
  void deleteStory(String storyid);
  void addStory(String userid, String story, String username, String category,
      String? userPhoto);
  void like(String docId, String userIs);
  void dislike(String? docId, String? userId);
  void updateStory(Story story);
}

class FireStoreRepo implements FireStoreRepository {
  late FirebaseFirestore firebaseFirestore;
  CollectionReference<Map<String, dynamic>> collectionRef =
      FirebaseFirestore.instance.collection('stories');

  FireStoreRepo({required this.firebaseFirestore});

  @override
  void addStory(String? userid, String? postStory, String? username,
      String? category, String? userPhoto) async {
    Story story = Story(
        userId: userid,
        userName: username,
        likes: [],
        dislikes: [],
        category: category,
        story: postStory,
        storyId: null,
        userPhoto: userPhoto);

    DocumentReference doc = await collectionRef.add(story.toMap());
    await doc.update({"storyId": doc.id});
  }

  @override
  void deleteStory(String storyid) {
    // TODO: implement deleteStory
  }

  @override
  Stream<QuerySnapshot> getAllStories() {
    return collectionRef.snapshots();
  }

  @override
  Future<List<Story>> getStoriesByCategory(String category) {
    // TODO: implement getStoriesByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Story>> getUserStories(String uid) {
    // TODO: implement getUserStories
    throw UnimplementedError();
  }

  @override
  void like(String? docId, String? userId) async {
    DocumentReference story =
        FirebaseFirestore.instance.collection('stories').doc(docId);
    await story.update({
      "likes": [userId]
    });
  }

  @override
  void dislike(String? docId, String? userId) async {
    DocumentReference story = collectionRef.doc(docId);
    await story.update({
      "dislikes": [userId]
    });
  }

  @override
  void updateStory(Story story) {
    DocumentReference docRef = collectionRef.doc(story.storyId);
    docRef.update(story.toMap());
  }
}
