import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hkili/data/models/Story.dart';
import 'package:hkili/data/repository/fire_store_repo.dart';

part 'fire_store_state.dart';

class FireStoreCubit extends Cubit<FireStoreState> {
  FireStoreCubit({required this.fireStoreRepo}) : super(FireStoreInitial());
  FireStoreRepo fireStoreRepo;

  void addStory(
      String? userid, String? postStory, String? username, String? category) {
    DataSending(received: false);
    fireStoreRepo.addStory(userid, postStory, username, category);
    DataSending(received: true);
  }

  Future<QuerySnapshot> getAllStories() {
    DataSending(received: false);
    Future<QuerySnapshot> stories = fireStoreRepo.getAllStories();
    DataSending(received: true);

    return stories;
  }
}
