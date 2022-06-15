import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Codenjobs app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                String url = 'https://codenjobs.com/';
                final parseUrl = Uri.parse(url);

                if (await canLaunchUrl(parseUrl)) {
                  await launchUrl(parseUrl,
                      mode: LaunchMode.inAppWebView,
                      webViewConfiguration: const WebViewConfiguration(
                        enableJavaScript: true,
                      ));
                }
              },
              child: const Text('Open Link'),
            ),
            ElevatedButton(
              onPressed: () async {
                String url = 'tel:+233803458767';
                final parseUrl = Uri.parse(url);

                if (await canLaunchUrl(parseUrl)) {
                  await launchUrl(
                    parseUrl,
                  );
                }
              },
              child: const Text('make phone call'),
            ),
            ElevatedButton(
              onPressed: () async {
                String url = 'sms:+233803458767';
                final parseUrl = Uri.parse(url);

                if (await canLaunchUrl(parseUrl)) {
                  await launchUrl(
                    parseUrl,
                  );
                }
              },
              child: const Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}
