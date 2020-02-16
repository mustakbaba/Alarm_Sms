import 'package:sms/sms.dart';
import 'AccessContacts.dart';

String telno;
String name;
int dakika = 44;
int saat = 15;
String islem;

class SendSms {
  void smsGonder(String a) {
    String mesaj = a;
    SmsSender sender = new SmsSender();
    String address = telno;
    if (dakika == DateTime.now().minute &&
        saat == DateTime.now().hour &&
        DateTime.now().second == 0) {
      sender.sendSms(new SmsMessage(address, mesaj));
    }
  }

  void islemYap() {
    switch (islem) {
      case "dakikaArttir":
        {
          dakika++;
        }
        break;
      case "dakikaAzalt":
        {
          dakika--;
        }
        break;
      case "saatArttir":
        {
          saat++;
        }
        break;
      case "saatAzalt":
        {
          saat--;
        }
        break;
    }
    if (dakika == 60) {
      saat++;
      dakika = 0;
    } else if (dakika < 0) {
      saat--;
      dakika = 59;
    } else if (saat == 24) {
      saat = 0;
    } else if (saat < 0) {
      saat = 24;
    }
  }
}
