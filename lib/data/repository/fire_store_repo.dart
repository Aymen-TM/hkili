import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hkili/data/models/Story.dart';

abstract class FireStoreRepository {
  Future<QuerySnapshot> getAllStories();
  Future<List<Story>> getUserStories(String uid);
  Future<List<Story>> getStoriesByCategory(String category);
  void deleteStory(String storyid);
  void addStory(String userid, String story, String username, String category);
}

class FireStoreRepo implements FireStoreRepository {
  late FirebaseFirestore firebaseFirestore;

  FireStoreRepo({required this.firebaseFirestore});

  @override
  void addStory(String? userid, String? postStory, String? username,
      String? category) async {
    Story story = Story(
        userId: userid,
        userName: username,
        likes: 0,
        dislikes: 0,
        category: category,
        story: postStory,
        storyId: null);
    CollectionReference stories =
        FirebaseFirestore.instance.collection('stories');
    DocumentReference doc = await stories.add(story.toMap());
    await doc.update({"storyId": doc.id});
  }

  @override
  void deleteStory(String storyid) {
    // TODO: implement deleteStory
  }

  @override
  Future<QuerySnapshot> getAllStories() {
    CollectionReference stories =
        FirebaseFirestore.instance.collection('stories');
    return stories.get();
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
}
