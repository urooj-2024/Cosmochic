import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class VirtualTryOnScreen extends StatefulWidget {
  const VirtualTryOnScreen({super.key});

  @override
  _VirtualTryOnScreenState createState() => _VirtualTryOnScreenState();
}

class _VirtualTryOnScreenState extends State<VirtualTryOnScreen> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;
  late FaceDetector _faceDetector;
  bool _isDetecting = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _faceDetector = GoogleMlKit.vision.faceDetector(
      FaceDetectorOptions(
        enableContours: true,
        enableClassification: true,
      ),
    );
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        debugPrint("No cameras available.");
        setState(() {
          _isCameraInitialized = false;
        });
        return;
      }

      _cameraController = CameraController(
        _cameras[1], // Use the front camera if available
        ResolutionPreset.medium,
      );

      await _cameraController.initialize();
      setState(() {
        _isCameraInitialized = true;
      });

      _cameraController.startImageStream((image) {
        if (!_isDetecting) {
          _isDetecting = true;
          _processImage(image).then((_) => _isDetecting = false);
        }
      });
    } catch (e) {
      debugPrint("Error initializing camera: $e");
      setState(() {
        _isCameraInitialized = false;
      });
    }
  }

  Future<void> _processImage(CameraImage image) async {
    try {
      final WriteBuffer allBytes = WriteBuffer();
      for (var plane in image.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      final bytes = allBytes.done().buffer.asUint8List();

      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        inputImageData: InputImageData(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          imageRotation: InputImageRotation.Rotation_0deg,
          inputImageFormat: InputImageFormat.NV21,
          planeData: image.planes.map(
                (Plane plane) {
              return InputImagePlaneMetadata(
                bytesPerRow: plane.bytesPerRow,
                width: plane.width,
                height: plane.height,
              );
            },
          ).toList(),
        ),
      );

      final faces = await _faceDetector.processImage(inputImage);

      if (faces.isNotEmpty) {
        for (Face face in faces) {
          debugPrint('Face detected at: ${face.boundingBox}');
          // Add overlay or further processing here
        }
      }
    } catch (e) {
      debugPrint("Error processing image: $e");
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Try-On'),
        backgroundColor: Colors.pink[50],
      ),
      body: _isCameraInitialized
          ? Stack(
        children: [
          CameraPreview(_cameraController),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Placeholder for further functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Try On",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
