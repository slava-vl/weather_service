import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  late final FirebaseAuth authInstance;
  AuthService() {
    authInstance = FirebaseAuth.instance;
  }

  bool isAuth() {
    final user = authInstance.currentUser;
    return user != null;
  }

  Future<String?> signIn(String emailAddress, String password) async {
    try {
      await authInstance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return e.code;
    } catch (e) {
      return 'UnknownError';
    }
  }

  Future<void> logout() async {
    await authInstance.signOut();
  }
}
