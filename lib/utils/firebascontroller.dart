import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void Initialing() async {
  await Firebase.initializeApp();
}

void stateChanges(context) async {
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushNamed(context, '/api', arguments: user);
      });
    }
  });
}

void stateFirebase(context) {
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      print('Hola');
    } else {
      print('Hola');
      Navigator.of(context)
          .pushReplacementNamed('/articles', arguments: 'Rafo');
    }
  });
}

void signIn({@required email, @required password, @required context}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showMaterialDialog(
          context: context, message: 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      showMaterialDialog(
          context: context, message: 'Wrong password provided for that user.');
    }
  }
}

void signUp({@required email, @required password, @required context}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

void signOut({@required context}) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushReplacementNamed('/login');
}

showMaterialDialog({@required context, @required String message}) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            title: new Text("Warning!"),
            content: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('Close me!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));

  void registerUser(
      {@required String email,
      @required String password,
      @required context}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMaterialDialog(
            context: context, message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showMaterialDialog(
            context: context,
            message: 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
