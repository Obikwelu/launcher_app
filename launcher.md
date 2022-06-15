# Opening Links within our Flutter app.

Subsequent to the previous post. Sometimes we  might want our users to be able to interact with links in our app. You could decide to send the user to their default web browser app but in order to incrreas etime spent on your app, you could include in app url laucher. This is a kind of webview properties for links in your app.

<h3><strong> Let's start</strong></h2>

1. Create a neew flutter project. I called mine launcher_app

```cmd
flutter create launcher_app
```
2. Then open in any code editor of your choice.

3. Then add the url_launcher plugin
```yaml
# This installs the latest version for us.
url_launcher:
```
4. Then in your AndroidManifest.xml file add this lines of code. The comments wxplains what each intent does.

```xml
<queries>
  <!-- If your app checks for https support -->
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="https" />
  </intent>
   <!-- If your app checks for http support -->
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="http" />
  </intent>
   <!-- If your app checks for SMS support -->
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="sms" />
  </intent>
  <!-- If your app checks for call support -->
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="tel" />
  </intent>
</queries>
```
5. Then in your Info.plist file add this lines of code.
```plist
<key>LSApplicationQueriesSchemes</key>
	<array>
  		<string>https</string>
  		<string>http</string>
  		<string>sms</string>
  		<string>tel</string>
	</array>
```

6. Then create your homescreen and import into main.dart

```dart
import 'package:flutter/material.dart';
import 'package:launcher_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Launcher App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}
```

7. Then create your homescreen and add three elevated buttons. The first to open a link. The second to make a call and the third to send a message.

```dart
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
```
The first button opens the codenjobs website link in an inappwebview and we enable javascript.

<p align = "center">
<img src= "https://raw.githubusercontent.com/Obikwelu/mediafile/main/blog%20media/preview.gif" />
</p>


That's all for this article. 

The you can get the source code at