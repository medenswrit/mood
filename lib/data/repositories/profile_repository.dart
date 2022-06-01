import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mood/constants/db_constants.dart';
import 'package:mood/data/models/custom_error.dart';
import 'package:mood/data/models/user_model.dart';

class ProfileRepository {
  final FirebaseFirestore firebaseFirestore;
  ProfileRepository({
    required this.firebaseFirestore,
  });

  Future<User> getProfile({required String uid}) async {
    try {
      final DocumentSnapshot userDoc = await usersReference.doc(uid).get();

      if (userDoc.exists) {
        final currentUser = User.fromDoc(userDoc);
        return currentUser;
      }

      throw 'User not found';
    } on FirebaseException catch (e) {
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
}
