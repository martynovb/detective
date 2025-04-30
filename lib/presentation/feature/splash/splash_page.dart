import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/navigation/route_constants.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text('Splash Page'),
          ElevatedButton(
            onPressed: () {
              context.go(RouteConstants.login.path);
            },
            child: const Text('Go to Login'),
          ),
        ],
      )),
    );
  }
}
