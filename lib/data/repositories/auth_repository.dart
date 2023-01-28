import 'package:doctor_app/data/models/users/user_model.dart';
import 'package:doctor_app/data/repositories/storage_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository{
  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFireStore;
  AuthRepository({required this.firebaseAuth,required this.firebaseFireStore});

  Future<String> signUp({required String email,required String password,required fcmToken,required String name}) async {

    try{
      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      UserModel newUser = UserModel(gender: "", address: "", birthDate: DateTime.now(), createdAt: DateTime.now(), imageUrl:user.user?.photoURL??"", fullName: name, phoneNumber: "", userId: "", fcmToken: fcmToken,email: email,password: password, favorites: []);
      var signedUser = await firebaseFireStore.collection("users").add(newUser.toJson());
      await firebaseFireStore
          .collection("users")
          .doc(signedUser.id)
          .update({"userId": signedUser.id});
      await StorageRepository.saveUserId(signedUser.id);

      return "Registered Successfully";
    }on FirebaseAuthException catch(e){
      return e.message.toString();
    }


}

  Future<String> signIn(String email,String password) async {
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      var user= await firebaseFireStore.collection("users").where("email",isEqualTo: email).get();
      await  StorageRepository.saveUserId(user.docs[0]["userId"]);
      print("Uid: ${user.docs[0]["userId"]}");
      return "Welcome";
    }on FirebaseAuthException catch(e){
      return e.message.toString();
    }
  }


  Future signInWithGoogle(String fcmToken,bool isCreate) async {
    try{
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      var user = await firebaseAuth.signInWithCredential(credential);
      if(isCreate){
        UserModel newUser = UserModel(gender: "", address: "", birthDate: DateTime.now(), createdAt: DateTime.now(), imageUrl:  googleUser.photoUrl??"", fullName:  googleUser.displayName??"", phoneNumber:  "", userId: user.user?.uid??"", fcmToken: fcmToken,email:  googleUser.email,password: "", favorites: []);
        var userFireStore = await firebaseFireStore.collection("users").add(newUser.toJson());
        await firebaseFireStore.collection("users").doc(userFireStore.id).update({"userId": userFireStore.id});
        await StorageRepository.saveUserId(userFireStore.id);
      }else{
        var user= await firebaseFireStore.collection("users").where("email",isEqualTo: googleUser.email).get();
        await StorageRepository.saveUserId(user.docs[0]["userId"]);
      }

    }on FirebaseAuthException catch(e){

      return e.message.toString();
    }
  }

  getUsersStatus(){
    firebaseAuth
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
