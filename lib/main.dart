import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rest_api_template/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const RestApiApp());
}
