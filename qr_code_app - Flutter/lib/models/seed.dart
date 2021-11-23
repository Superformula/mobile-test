class Seed {
  String? id;
  String? expiryTime;

  Seed(this.id, this.expiryTime);

  Seed.fromJson(Map<String, dynamic> json) {
    id = json['seed'];
    expiryTime = json['expires_at'];
  }

  String getTime() {
    try {
      if (expiryTime != null && expiryTime?.isNotEmpty == true) {
        return DateTime.parse(expiryTime!.split(" - ")[0].trim())
            .minute
            .toString();
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }
}
