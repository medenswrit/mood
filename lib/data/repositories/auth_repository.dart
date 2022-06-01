import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mood/constants/db_constants.dart';
import 'package:mood/data/models/custom_error.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final fbAuth.FirebaseAuth firebaseAuth;
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();

  AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  Stream<fbAuth.User?> get user => firebaseAuth.userChanges();

  Future<void> logInWithGoogle() async {
    try {
      late final fbAuth.AuthCredential credential;
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      credential = fbAuth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredentials =
          await firebaseAuth.signInWithCredential(credential);

      final signedInUser = userCredentials.user!;
      String idToken = await signedInUser.getIdToken();
      print(idToken);
      await usersReference.doc(signedInUser.uid).set({
        'name': signedInUser.displayName,
        'email': signedInUser.email,
        'idToken': idToken,
      });
    } on fbAuth.FirebaseAuthException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> signout() async {
    await firebaseAuth.signOut();
  }
}
