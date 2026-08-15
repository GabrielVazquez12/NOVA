import 'package:flutter/material.dart';
import 'nova_orb.dart';
import 'nova_state.dart';
import 'nova_api.dart';
import 'nova_voice.dart';

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

class NovaHomePage extends StatefulWidget {
  const NovaHomePage({super.key});

  @override
  State<NovaHomePage> createState() => _NovaHomePageState();
}

class _NovaHomePageState extends State<NovaHomePage> {
  String _reply = '';

  @override
  void initState() {
    super.initState();
    NovaVoice.speak('Bienvenido, señor');
  }

  Future<void> _testBackend() async {
    final reply = await NovaApi.sendMessage('¿Cómo está el clima en Saltillo?');
    setState(() {
      _reply = reply;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const NovaOrb(state: NovaState.idle),
            const SizedBox(height: 24),
            Text(
              _reply,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _testBackend,
              child: const Text('Probar backend'),
            ),
          ],
        ),
      ),
    );
  }
}
