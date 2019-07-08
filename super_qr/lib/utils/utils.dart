import 'package:url_launcher/url_launcher.dart';

Future openUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
  } else {
    print('Could not launch $url');
  }
}
