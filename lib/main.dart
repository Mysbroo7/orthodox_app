import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // إعداد OneSignal
  OneSignal.initialize("3519d022-1934-4d19-9795-a5a0a987bca2");
  OneSignal.Notifications.requestPermission(true);

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OrthodoxWebView(),
  ));
}

class OrthodoxWebView extends StatefulWidget {
  const OrthodoxWebView({super.key});
  @override
  State<OrthodoxWebView> createState() => _OrthodoxWebViewState();
}

class _OrthodoxWebViewState extends State<OrthodoxWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..loadRequest(Uri.parse('https://orthodoxjo.tv/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}