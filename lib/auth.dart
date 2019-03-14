import 'package:flutter/material.dart';
//services
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class Auth {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//  Auth(GoogleSignIn googleSignIn, FirebaseAuth firebaseAuth)
//  {
//    this._googleSignIn = googleSignIn;
//    this._firebaseAuth = firebaseAuth;
//  }

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    //TODO: handle null googleAcount
    final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
    final AuthCredential credentials = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    return _firebaseAuth.signInWithCredential(credentials);
  }
}

final Auth authService = Auth();

/**
class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Observable<FirebaseUser> user; //firease user
  Observable<Map<String, dynamic>> profile; //custom user data in Firestone
  PublishSubject loading = PublishSubject();

  //constructor
  AuthService() {
    user = Observable(_auth.onAuthStateChanged);

    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return _db.collection('users').document(u.uid).snapshots().map((snap) => snap.data);
      }
      else {
        return Observable.just({ });
      }
    });
  }

  Future<FirebaseUser> googleSignIn() async {
    loading.add(true);
    GoogleSignInAccount googleUser = await _googleSignIn.signInSilently();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credentials = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    FirebaseUser user = await _auth.signInWithCredential(credentials);
  }

//  void updateUserData(FirebaseUser) async {
//    DocumentReference ref = _db.collection('users').document(user.uid);
//
//    return ref.setData({
//      'uid':user.uid,
//      'email': user.email,
//      'photoURL': user.photoUrl,
//      'displayName': user.displayName,
//      'lastSeen': DateTime.now()
//    }, merge: true);
//  }

  void signOut() {
    _auth.signOut();
  }
}


final AuthService authService = AuthService();

    **/