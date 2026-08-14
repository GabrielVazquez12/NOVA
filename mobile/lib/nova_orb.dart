import 'package:flutter/material.dart';
import 'nova_state.dart';
import 'dart:math';

class NovaOrb extends StatefulWidget {
  final NovaState state;

  const NovaOrb({super.key, required this.state});

  @override
  State<NovaOrb> createState() => _NovaOrbState();
}

class _Node {
  final double angle;
  final double radiusFactor;
  final double phaseOffset;

  _Node({
    required this.angle,
    required this.radiusFactor,
    required this.phaseOffset,
  });
}

class _NovaOrbState extends State<NovaOrb> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Node> _nodes;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    final random = Random(42);
    const nodeCount = 40;
    _nodes = List.generate(nodeCount, (index) {
      final baseAngle = (index / nodeCount) * 2 * pi;
      final jitter = (random.nextDouble() - 0.5) * 0.3;
      return _Node(
        angle: baseAngle + jitter,
        radiusFactor: 0.2 + random.nextDouble() * 0.8,
        phaseOffset: random.nextDouble() * 2 * pi,
      );
    });
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
          size: const Size(320, 320),
          painter: _OrbPainter(
            progress: _controller.value,
            state: widget.state,
            nodes: _nodes,
          ),
        );
      },
    );
  }
}

class _OrbPainter extends CustomPainter {
  final double progress;
  final NovaState state;
  final List<_Node> nodes;

  _OrbPainter({
    required this.progress,
    required this.state,
    required this.nodes,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final baseRadius = size.width / 2;

    final nodePaint = Paint()..color = Colors.redAccent;

    final nodePositions = <Offset>[];

    final glowPaint = Paint()
      ..color = Colors.redAccent.withValues(alpha: 0.15)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);

    canvas.drawCircle(center, baseRadius * 0.3, glowPaint);

    for (final node in nodes) {
      final pulse = sin((progress * 2 * pi) + node.phaseOffset);
      final r = baseRadius * node.radiusFactor * (0.9 + 0.1 * pulse);
      final x = center.dx + r * cos(node.angle);
      final y = center.dy + r * sin(node.angle);
      final position = Offset(x, y);

      nodePositions.add(position);
      canvas.drawCircle(position, 3, nodePaint);
    }
    final linePaint = Paint()
      ..color = Colors.redAccent.withValues(alpha: 0.3)
      ..strokeWidth = 1;

    for (int i = 0; i < nodePositions.length; i++) {
      for (int j = i + 1; j < nodePositions.length; j++) {
        final distance = (nodePositions[i] - nodePositions[j]).distance;
        if (distance < 50) {
          canvas.drawLine(nodePositions[i], nodePositions[j], linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _OrbPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.state != state;
  }
}
