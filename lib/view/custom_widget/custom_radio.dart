import 'package:delivery_boy/values/export.dart';
import 'package:get/get.dart';

class CustomRadio extends StatefulWidget {
  final String titel;
  final String titel2;
  final String titel3;
  CustomRadio(
    this.titel,
    this.titel2,
    this.titel3,
  );
  @override
  _CustomerRadioState createState() => _CustomerRadioState();
}

enum SingingCharacter { chash, online, program }

class _CustomerRadioState extends State<CustomRadio> {
  SingingCharacter? _character = SingingCharacter.chash;
  AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RadioListTile<SingingCharacter>(
          dense: true,
          value: SingingCharacter.chash,
          groupValue: _character,
          activeColor: AppColors.primary,
          title: CustomText(
            text: widget.titel,
            fontSize: 18,
          ),
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
              //print(_character);
              // AppController.payment.value = "دفع كاش";
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          dense: true,
          value: SingingCharacter.online,
          groupValue: _character,
          activeColor: AppColors.primary,
          title: CustomText(
            text: widget.titel2,
            fontSize: 18,
          ),
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
              //print(_character);
              // AppController.payment.value = "دفع الالكتروني";
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          dense: true,
          value: SingingCharacter.program,
          groupValue: _character,
          activeColor: AppColors.primary,
          title: CustomText(
            text: widget.titel3,
            fontSize: 18,
          ),
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
              //print(_character);
              // AppController.payment.value = "برنامج التامين العائلي";
            });
          },
        ),
      ],
    );
  }
}
