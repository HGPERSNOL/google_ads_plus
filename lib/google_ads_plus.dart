// ignore_for_file: must_be_immutable

library google_ads_plus;

import 'package:flutter/material.dart';
import 'package:google_ads_plus/ad_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdPlus extends StatefulWidget {
  String unitID;
  AdSize adSize;
  BannerAdPlus({super.key, required this.adSize, required this.unitID});

  @override
  State<BannerAdPlus> createState() => _BannerAdPlusState();
}

class _BannerAdPlusState extends State<BannerAdPlus> {
  AdController adController = AdController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAds();
  }

  loadAds() async {
    adController.loadBannerAd(widget.unitID, widget.adSize);
  }

  @override
  Widget build(BuildContext context) {
    return adController.isBannerAdLoaded ? AdWidget(ad: adController.bannerAd!) : Container();
  }
}

class InterAdPlus {
  AdController interAdController = AdController();

  Future<void> loadAndShowInterstitialAd({required String unitID}) async {
    await interAdController.loadInterstitialAd(unitID);
    Future.delayed(const Duration(seconds: 3)).then((value) => interAdController.interstitialAd!.show());
  }
}
