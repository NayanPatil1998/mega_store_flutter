import 'package:firebase_auth/firebase_auth.dart';
import 'package:mega_store/models/user.model.dart';
import 'package:mega_store/services/httpServices.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final HttpService api = HttpService();

  UserModel userFromFirebaseUser(User user) {
    return user != null
        ? UserModel(
            uid: user.uid,
            displayName: user.displayName,
            email: user.email,
            imageUrl: user.photoURL,
            phone: user.phoneNumber)
        : null;
  }

  Stream<User> get user {
    // initializeFlutterFire();
    return _auth.userChanges();
    // .map((FirebaseUser user) => _userFromFirebaseser(user));
  }

  Future signInWithToken(String token) async {
    try {
      UserCredential result = await _auth.signInWithCustomToken(token);
      return result;
    } catch (e) {
      return e;
    }
  }

  Future signUpwithEmail(String email, String password, String name) async {
    try {
      print(email);
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.toString().trim(), password: password.toString().trim());
      User user = result.user;
      await nameUpdateAfterRegister(name);
      await api.postUserData(email, name, user.uid);
      return userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  Future nameUpdateAfterRegister(String name) async {
    try {
      User user = FirebaseAuth.instance.currentUser;

      // UserInfo userUpdateInfo = new UserInfo();
      // userUpdateInfo.displayName = name;

      await user.updateProfile(displayName: name);
      user.reload();
    } catch (e) {
      print(e.toString());
    }
  }

  Future signInwithEmail(String email, String password) async {
    try {
      print(email);
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email.toString().trim(), password: password.toString().trim());
      User user = result.user;
      // if (!user.emailVerified) {
      //   await user.sendEmailVerification();
      // }
      return userFromFirebaseUser(user);
    } catch (e) {
      return e;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
