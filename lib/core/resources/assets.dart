class AssetsPaths {
  static const String az = "az";
  static const String chef = "chef";
}

extension AssetToPath on String {
  get flagToPath => "assets/flags/flag_$this.png";
  get imageToPath => "assets/images/ig_$this.png";
}
