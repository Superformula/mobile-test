import 'package:url_launcher/url_launcher.dart';

/// Open the given url (String)
Future openUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
  } else {
    print('Could not launch $url');
  }
}

/// Get the current difference between now and the given datetime
Duration getDifferenceFromNow(DateTime futureDate) {
  return futureDate.difference(DateTime.now());
}
