import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InfoPage extends StatefulWidget {
  final String Link;
  const InfoPage({Key? key, required this.Link}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late InAppWebViewController myWeb;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if (await myWeb.canGoBack()) {
              myWeb.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: InAppWebView(
            onWebViewCreated: (controller) async {
              myWeb = controller;
            },
            initialUrlRequest: URLRequest(
              url: Uri.parse(widget.Link),
            ),
          ),
        ),
      ),
    );
  }
}
