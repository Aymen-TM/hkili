import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hkili/data/models/Story.dart';
import 'package:hkili/data/repository/fire_store_repo.dart';

part 'fire_store_state.dart';

class FireStoreCubit extends Cubit<FireStoreState> {
  FireStoreCubit({required this.fireStoreRepo}) : super(FireStoreInitial());

  FireStoreRepo fireStoreRepo;

  void addStory(String? userid, String? postStory, String? username,
      String? category, String? userPhoto) {
    fireStoreRepo.addStory(userid, postStory, username, category, userPhoto);
  }

  Stream<QuerySnapshot> getAllStories() {
    Stream<QuerySnapshot> stories = fireStoreRepo.getAllStories();
    return stories;
  }

  void like(String? docId, String? userId) {
    fireStoreRepo.like(docId, userId);
  }

  void dislike(String? docId, String? userId) {
    fireStoreRepo.dislike(docId, userId);
  }

  void updateStory(Story story) {
    fireStoreRepo.updateStory(story);
  }
}
