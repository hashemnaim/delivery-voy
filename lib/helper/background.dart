import 'dart:async';
import 'dart:math';

import 'package:delivery_boy/helper/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../module/laundry_delivary/orders/controller/controller_order.dart';
import '../routes/app_pages.dart';

class ParticleBackgroundPage extends StatefulWidget {
  ParticleBackgroundPage({Key? key}) : super(key: key);

  @override
  State<ParticleBackgroundPage> createState() => _ParticleBackgroundPageState();
}

class _ParticleBackgroundPageState extends State<ParticleBackgroundPage> {
  final OrderController orderController = Get.find();

  // String audioasset = "assets/sounds/alert.mp3";
  Timer? timer = Timer.periodic(Duration(seconds: 3), (timer) {
    FlutterRingtonePlayer.play(fromAsset: "assets/sounds/alert.mp3");
    FlutterRingtonePlayer.play(
      android: AndroidSounds.notification,
      ios: IosSounds.glass,
      looping: false,
      volume: 1.0,
    );
  });
  @override
  void initState() {
    FlutterRingtonePlayer.play(fromAsset: "assets/sounds/alert.mp3");
    FlutterRingtonePlayer.play(
      android: AndroidSounds.notification,
      ios: IosSounds.glass,
      looping: false,
      volume: 1.0,
    );
    timer;
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onTap: () async {
        await FlutterRingtonePlayer.stop();

        return Get.offAllNamed(Routes.MAIN);
      },
      child: Stack(
        children: [
          Positioned.fill(child: AnimatedBackground()),
          Positioned.fill(child: Particles(30)),
          Positioned.fill(child: CenteredText()),
        ],
      ),
    ));
  }
}

class Particles extends StatefulWidget {
  final int numberOfParticles;

  const Particles(this.numberOfParticles, {key}) : super(key: key);

  @override
  _ParticlesState createState() => _ParticlesState();
}

class _ParticlesState extends State<Particles> {
  final Random random = Random();

  final List<ParticleModel> particles = [];

  @override
  void initState() {
    List.generate(widget.numberOfParticles, (index) {
      particles.add(ParticleModel(random));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Rendering(
      startTime: const Duration(seconds: 30),
      onTick: _simulateParticles,
      builder: (context, time) {
        return CustomPaint(
          painter: ParticlePainter(particles, time),
        );
      },
    );
  }

  _simulateParticles(Duration time) {
    for (var particle in particles) {
      particle.maintainRestart(time);
    }
  }
}

class ParticleModel {
  Animatable? tween;
  double? size;
  AnimationProgress? animationProgress;
  Random? random;

  ParticleModel(this.random) {
    restart();
  }

  restart({Duration time = Duration.zero}) {
    final startPosition = Offset(-0.2 + 1.4 * random!.nextDouble(), 1.2);
    final endPosition = Offset(-0.2 + 1.4 * random!.nextDouble(), -0.2);
    final duration = Duration(milliseconds: 3000 + random!.nextInt(6000));

    tween = MultiTrackTween([
      Track("x").add(
          duration, Tween(begin: startPosition.dx, end: endPosition.dx),
          curve: Curves.easeInOutSine),
      Track("y").add(
          duration, Tween(begin: startPosition.dy, end: endPosition.dy),
          curve: Curves.easeIn),
    ]);
    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = 0.2 + random!.nextDouble() * 0.4;
  }

  maintainRestart(Duration time) {
    if (animationProgress!.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}

class ParticlePainter extends CustomPainter {
  List<ParticleModel> particles;
  Duration time;

  ParticlePainter(this.particles, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withAlpha(50);

    for (var particle in particles) {
      var progress = particle.animationProgress!.progress(time);
      final animation = particle.tween!.transform(progress);
      final position =
          Offset(animation["x"] * size.width, animation["y"] * size.height);
      canvas.drawCircle(position, size.width * 0.2 * particle.size!, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(
          const Duration(seconds: 3),
          ColorTween(
              begin: const Color(0xff8a113a), end: Colors.lightBlue.shade900)),
      Track("color2").add(const Duration(seconds: 3),
          ColorTween(begin: const Color(0xff440216), end: Colors.blue.shade600))
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, dynamic animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}

class CenteredText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "طلب جديد",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        textScaleFactor: 6,
      ),
    );
  }
}
