import 'package:flutter/material.dart';
import 'nova_orb.dart';
import 'nova_state.dart';

void main() {
  runApp(const NovaApp());
}
class NovaApp extends StatelessWidget {
  const NovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NOVA',
      theme: ThemeData.dark(),
      home: const NovaHomePage(),
    );
  }
}

class NovaHomePage extends StatelessWidget {
  const NovaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: NovaOrb(state: NovaState.idle)
      ),
    );
  }
}