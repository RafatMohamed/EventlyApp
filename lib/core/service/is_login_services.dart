import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../feature/login/view/login_view.dart';
import '../../feature/main_app_view/view/main_app_view.dart';
import '../utilities/app_text.dart';
import 'AuthServicesFirebase/auth_services_firebase.dart';
import 'Provider/auth_services.dart';

class AuthGate extends StatefulWidget {
  static const String routeName = "/${AppText.authGateViewApp}";

  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      final user = await AuthServicesFirebase.getUserFirebase(firebaseUser.uid);
      if (!mounted) return;
      Provider.of<AuthServicesProvider>(
        context,
        listen: false,
      ).streamUser(user);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData) {
          return const MainAppView();
        }
        return const LoginView();
      },
    );
  }
}