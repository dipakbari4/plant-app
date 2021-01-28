import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isSigningIn;

  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  // Get uid
  Future<String> getCurrentUid() async {
    return _firebaseAuth.currentUser.uid;
  }

  // Get current Users
  getCurrentUser() {
    return _firebaseAuth.currentUser.displayName;
  }

  // Get image url
  getUserImage() {
    if (_firebaseAuth.currentUser.photoURL != null) {
      return NetworkImage(
        _firebaseAuth.currentUser.photoURL,
      );
    } else
      return Icon(Icons.account_circle_outlined);
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future login() async {
    isSigningIn = true;
    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      isSigningIn = false;
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
