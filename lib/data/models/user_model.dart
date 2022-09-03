import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String? name;
  final String? email;
  final String? photo;

  UserModel({required this.uid, this.name, this.email, this.photo});

  static final empty = UserModel(uid: " ");
  bool get isEmpty => this == UserModel.empty;

  @override
  List<Object?> get props => [uid, name, email, photo];
}
