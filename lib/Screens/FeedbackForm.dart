import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Feedback Form'),
        ),
        body: const WebView(
            initialUrl: 'https://docs.google.com/forms/d/1bTrLRC6Fnycooo881xm6WcXZmmsf_UPH4oX9cUFq_LQ/edit',
            javascriptMode: JavascriptMode.unrestricted,
            ),
        );
    }
}
