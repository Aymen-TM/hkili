import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hkili/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepository {
  UserModel? currentUser();
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
  Future<void> passwordResetSubmit(String email);
  Future<void> signInWithGoogle();
  Future<bool> isFirstRun();
  Future<void> updatePersonalData(
      String firstname, String lastName, String birthday);
}

class FirebaseAuthRepo implements AuthRepository {
  FirebaseAuth auth;
  GoogleSignIn googleSignIn;

  FirebaseAuthRepo({required this.auth, required this.googleSignIn});

  @override
  UserModel? currentUser() {
    User user = auth.currentUser!;
    return user != null
        ? UserModel(
            uid: user.uid,
            name: user.displayName,
            email: user.email,
            photo: user.photoURL)
        : null;
  }

  @override
  Future<bool> isFirstRun() {
    // TODO: implement isFirstRun
    throw UnimplementedError();
  }

  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  @override
  Future<void> passwordResetSubmit(String email) {
    // TODO: implement passwordResetSubmit
    throw UnimplementedError();
  }

  @override
  Future<void> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential result = await auth.signInWithCredential(credential);
      final prefs = await SharedPreferences.getInstance();
      var key = 'uid';
      var val = result.user!.uid;
      prefs.setString(key, val);
    } catch (e) {
      throw (e);
    }
  }

  @override
  Future<void> updatePersonalData(
      String firstname, String lastName, String birthday) {
    // TODO: implement updatePersonalData
    throw UnimplementedError();
  }
}
