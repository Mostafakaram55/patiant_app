import 'package:url_launcher/url_launcher.dart';
Future<void>openLink(String link)async{
  String urLink=link;
  if(await canLaunch((urLink))){
    await launch (urLink);
  }
  else{
    await launch (urLink);
  }
}

void makePhoneCall(String phoneNumber) async {
  String url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else{
    await launch (url);
  }
}