import 'package:alarm_sms/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'SendSms.dart';
import 'package:timer_builder/timer_builder.dart';
import 'constants.dart';

class SetAlarmPage extends StatefulWidget {
  static const String id = 'setAlarm_page';
  String mesajYaz = 'ssadda';
  _SetAlarmPageState createState() => _SetAlarmPageState();
}

@override
class _SetAlarmPageState extends State<SetAlarmPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  SetAlarmPage f = new SetAlarmPage();
  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
      Duration(seconds: 1),
      builder: (context) {
        SendSms().smsGonder(f.mesajYaz);
        return Scaffold(
          appBar: AppBar(title: Text('Alarm Sms Project')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              Text(
                "${DateTime.now().hour}" +
                    ":"
                        "${DateTime.now().minute}" +
                    ":"
                        "${DateTime.now().second}",
                style: kNow,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                name,
                style: kNow,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Mesajınızı giriniz',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                controller: myController,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    saat.toString(),
                    style: kDateText,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    ":",
                    style: kDateText,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(dakika.toString(), style: kDateText),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform.scale(
                    scale: 2,
                    child: IconButton(
                      onPressed: () {
                        islem = "saatArttir";
                        SendSms().islemYap();
                      },
                      icon: ImageIcon(
                        AssetImage('assets/up.png'),
                        color: kWhite,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Transform.scale(
                    scale: 2,
                    child: IconButton(
                      onPressed: () {
                        islem = "dakikaArttir";
                        SendSms().islemYap();
                      },
                      icon: ImageIcon(
                        AssetImage('assets/up.png'),
                        color: kWhite,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform.scale(
                    scale: 2,
                    child: IconButton(
                      onPressed: () {
                        islem = "saatAzalt";
                        SendSms().islemYap();
                      },
                      icon: ImageIcon(
                        AssetImage('assets/down.png'),
                        color: kWhite,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: 150,
                  ),
                  Transform.scale(
                    scale: 2,
                    child: IconButton(
                      onPressed: () {
                        islem = "dakikaAzalt";
                        SendSms().islemYap();
                      },
                      icon: ImageIcon(
                        AssetImage('assets/down.png'),
                        color: kWhite,
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                child: Text('Mesajı kaydet.'),
                onPressed: () {
                  f.mesajYaz = myController.text;
                  Alert(
                    context: context,
                    type: AlertType.info,
                    title: "Emin misin?",
                    desc: f.mesajYaz + " mesajı kaydedilsin mi?",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "İptal Et",
                          style: TextStyle(color: kWhite, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Color.fromRGBO(0, 179, 134, 1.0),
                      ),
                      DialogButton(
                        child: Text(
                          "Kabul Et",
                          style: TextStyle(color: kWhite, fontSize: 20),
                        ),
                        onPressed: () {
                          f.mesajYaz = myController.text;
                          Navigator.pop(context);
                        },
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(116, 116, 191, 1.0),
                          Color.fromRGBO(52, 138, 199, 1.0)
                        ]),
                      )
                    ],
                  ).show();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
