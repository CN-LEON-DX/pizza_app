import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/src/entities/entities.dart';
import 'package:user_repository/src/user_repo.dart';
import 'models/models.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('user');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

// Keep tracking the state of user sign-in or not
  @override
  Stream<MyUser?> get user {
    return _firebaseAuth.authStateChanges().flatMap((firebaseUser) async* {
      if (firebaseUser == null){
        yield MyUser.empty;
      }else {
        yield await usersCollection
          .doc(firebaseUser.uid)
          .get()
          .then((value) => MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
      }
    });
  }
  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password
      );

      myUser.userId = user.user!.uid;

      return myUser;
    } catch (e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> setUserData(MyUser myUser) async {
    try {
      await usersCollection
        .doc(myUser.userId)
        .set(myUser.toEntity().toDocument());
    } catch (e){
      log(e.toString());
      rethrow;
    }
  }
  
}


// Registering a new user.
// Signing in and signing out users.
// Fetching user data from Firestore.
// Updating user information.
// Handling user authentication states