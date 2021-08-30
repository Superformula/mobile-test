class QrValidate {
  QrValidate({
    this.qrVal,
  });

  String? qrVal;

  factory QrValidate.fromJson(Map<String, dynamic> json) => QrValidate(
        qrVal: json["qrVal"],
      );

  Map<String, dynamic> toJson() => {
        "qrVal": qrVal,
      };
}
