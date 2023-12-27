import 'package:flutter/material.dart';

class CRDownloadWaitingProvider extends ChangeNotifier {
  bool _isDownloading = false;
  bool get isDownloading => _isDownloading;
  changeDownload() {
    _isDownloading = !_isDownloading;
    notifyListeners();
  }
}
