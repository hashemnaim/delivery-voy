// ignore_for_file: deprecated_member_use
import 'package:url_launcher/url_launcher.dart';

class Launcher {
  Launcher._();
  static final Launcher launcher = Launcher._();

  launchPhone(String phone) {
    launch('tel:+${phone}');
  }

  launchWhatsapp(String phone) {
    launch("https://wa.me/$phone?text=");
  }

  launchEmail(String email) {
    launch('mailto:$email');
  }

  launchURL(String url) {
    launch('$url');
  }
}
