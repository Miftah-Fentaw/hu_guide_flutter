import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AiAssistantWebView extends StatefulWidget {
  const AiAssistantWebView({super.key});

  @override
  State<AiAssistantWebView> createState() => _AiAssistantWebViewState();
}

class _AiAssistantWebViewState extends State<AiAssistantWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/chatbase.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
