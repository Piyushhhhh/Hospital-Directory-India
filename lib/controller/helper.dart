import 'package:url_launcher/url_launcher.dart';

launchURL(String uri) async {
  Uri url = Uri.parse(uri);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
