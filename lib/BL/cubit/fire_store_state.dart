part of 'fire_store_cubit.dart';

abstract class FireStoreState extends Equatable {
  const FireStoreState();

  @override
  List<Object> get props => [];
}

class FireStoreInitial extends FireStoreState {}

class DataSending extends FireStoreState {
  bool received = false;
  DataSending({required this.received});
}
