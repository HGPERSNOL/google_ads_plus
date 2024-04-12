import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdController extends GetxController {
  String? bannerAdUnitId;
  String? interstitialAdUnitId;
  BannerAd? bannerAd;
  bool isBannerAdLoaded = false;
  InterstitialAd? interstitialAd;
  bool isInterstitialAdLoaded = false;

  loadBannerAd(String id, AdSize adSize) {
    bannerAd = BannerAd(
      adUnitId: id,
      request: const AdRequest(),
      size: adSize,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print('$ad loaded.');
          isBannerAdLoaded = true;
          update();
        },
        onAdFailedToLoad: (ad, err) {
          print('BannerAd failed to load: $err');
          ad.dispose();
        },
      ),
    )..load();
  }

  loadInterstitialAd(String iID) {
    InterstitialAd.load(
      adUnitId: iID,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          isInterstitialAdLoaded = true;
          print('$ad loaded.');
          interstitialAd = ad;

          update();
        },
        onAdFailedToLoad: (error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  @override
  void onClose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    super.onClose();
  }
}
