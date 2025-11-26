class CalculatorSettings {
  int decimalPrecision;
  bool hapticFeedback;
  bool soundEffects;
  int historyLimit;
  int themeMode; 
  int angleMode;

  CalculatorSettings({
    this.decimalPrecision = 2,
    this.hapticFeedback = true,
    this.soundEffects = false,
    this.historyLimit = 50,
    this.themeMode = 0,
    this.angleMode = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      "decimalPrecision": decimalPrecision,
      "hapticFeedback": hapticFeedback,
      "soundEffects": soundEffects,
      "historyLimit": historyLimit,
      "themeMode": themeMode,
      "angleMode": angleMode,
    };
  }

  factory CalculatorSettings.fromJson(Map<String, dynamic> json) {
    return CalculatorSettings(
      decimalPrecision: json["decimalPrecision"] ?? 2,
      hapticFeedback: json["hapticFeedback"] ?? true,
      soundEffects: json["soundEffects"] ?? false,
      historyLimit: json["historyLimit"] ?? 50,
      themeMode: json["themeMode"] ?? 0,
      angleMode: json["angleMode"] ?? 0,
    );
  }
}
