import 'package:flutter/material.dart';
import 'package:google_ads_plus/google_ads_plus.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'demo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: 80, //change height as per your need
              child: BannerAdPlus(
                unitID: "ca-app-pub-3940256099942544/6300978111", //add google Banner ads id
                adSize: AdSize.fullBanner, //change Size as per your need
              )),
          ElevatedButton(
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Demo();
                  },
                ));
                InterAdPlus().loadAndShowInterstitialAd(
                    unitID: "ca-app-pub-3940256099942544/1033173712"); //add google Interstitial ads id
              },
              child: const Text("Click Me For Interstitial Ads"))
        ],
      ),
    );
  }
}
