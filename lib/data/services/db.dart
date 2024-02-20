import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DBServices {
  CollectionReference notesDB = FirebaseFirestore.instance.collection('notes');
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get user => auth.authStateChanges();

  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    GoogleSignInAccount? googleUser = await (googleSignIn.signIn());

    if (googleUser == null) {
      googleUser = await (googleSignIn.signIn());
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }

  uploadFile(file) async {
    Reference reference = storage.ref().child('notes/${DateTime.now()}');
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }
}
