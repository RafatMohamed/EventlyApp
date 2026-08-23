import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/models/auth_model.dart';
import 'package:evently_app/core/service/Provider/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class AuthServicesFirebase {
  static CollectionReference<AuthModel> authRef = FirebaseFirestore.instance
      .collection('Clients')
      .withConverter<AuthModel>(
        fromFirestore: (snapshot, _) =>
            AuthModel.fromFirebase(snapshot.data()!),
        toFirestore: (user, _) => user.toFirebase(),
      );

  static Future<void> addUsersFirebase(AuthModel user) {
    DocumentReference docRef = authRef.doc(user.userId);
    return docRef.set(user);
  }

  static Future<AuthModel> getUserFirebase(String userId) async {
    var snapShot = await authRef.doc(userId).get();
    return snapShot.data()!;
  }

  static Future<AuthModel> registerUser({
    required String name,
    required String email,
    required String pass,
  }) async {
    final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
    AuthModel user = AuthModel(
      name: name,
      email: email,
      userId: userCredential.user!.uid,
    );
    await addUsersFirebase(user);
    return user;
  }

  static Future<AuthModel> loginUser({
    required String email,
    required String pass,
  }) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
    return await getUserFirebase(userCredential.user!.uid);
  }
  static Future<AuthModel> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw Exception("Google sign in cancelled");
    }
    try{

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      final firebaseUser = userCredential.user!;

      final doc = await authRef.doc(firebaseUser.uid).get();

      if (doc.exists) {
        Provider.of<AuthServicesProvider>(
          context,
          listen: false,
        ).streamUser(doc.data());
        return doc.data()!;
      }

      final user = AuthModel(
        userId: firebaseUser.uid,
        name: firebaseUser.displayName ?? "",
        email: firebaseUser.email ?? "",
      );

      await addUsersFirebase(user);

      Provider.of<AuthServicesProvider>(
        context,
        listen: false,
      ).streamUser(user);

      return user;
    }catch(error){
      rethrow;
    }
  }

  static Future<void> logOut({required BuildContext context})async{
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    if (!context.mounted) return;
    Provider.of<AuthServicesProvider>(context,listen: false).streamUser(null);
  }
  static Future<void> resetPassword({required String email})async{
    var snapShot = await authRef.where("email",isEqualTo: email).limit(1).get();
    if(snapShot.docs.isEmpty){
      throw Exception("this email is not Register , please try again");
    }
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email,);
  }
}
