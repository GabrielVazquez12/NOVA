import 'package:flutter/material.dart';
import 'nova_state.dart';

class NovaOrb extends StatefulWidget {
  final NovaState state;

  const NovaOrb({super.key, required this.state});

  @override
  State<NovaOrb> createState() => _NovaOrbState();
}

class _NovaOrbState extends State<NovaOrb> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(250, 250),
          painter: _OrbPainter(
            progress: _controller.value,
            state: widget.state,
          ),
        );
      },
    );
  }
}

class _OrbPainter extends CustomPainter {
  final double progress;
  final NovaState state;
  _OrbPainter({required this.progress, required this.state});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..color = Colors.white;

    final radius = 60 + (10 * progress);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _OrbPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.state != state;
  }
}
