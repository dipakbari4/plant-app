import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant/screens/home.dart';
import 'package:plant/screens/login.dart';
import 'package:plant/services/auth.dart';
import 'package:provider/provider.dart';

class StateCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);
              return provider.isSigningIn
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (snapshot.hasData)
                      ? HomeScreen()
                      : LoginScreen();
            },
          ),
        ),
      );
}
