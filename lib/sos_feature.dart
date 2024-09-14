// lib/sos_feature.dart
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';

class SosFeature extends StatefulWidget {
  const SosFeature({super.key}); // Added key parameter

  @override
  SosFeatureState createState() => SosFeatureState(); // Make the state class public
}

class SosFeatureState extends State<SosFeature> {
  late CameraController _controller;
  late List<CameraDescription> cameras;
  final Logger _logger = Logger();

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    await _controller.initialize();
  }

  Future<void> sendLocation() async {
    Location location = Location();
    LocationData? currentLocation;

    try {
      currentLocation = await location.getLocation();
      _logger.i("Location: ${currentLocation.latitude}, ${currentLocation.longitude}");
    } catch (e) {
      _logger.e("Could not get location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SOS Feature")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              sendLocation();
              _controller.takePicture();
            },
            child: const Text("Send SOS"),
          ),
          CameraPreview(_controller),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}