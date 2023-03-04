import '../../../../utils/export.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widget/AppCustomer.dart';
import '../../../Widget/custom_button.dart';

class ForgetScreen extends StatefulWidget {
  @override
  _ProdactScreenState createState() => _ProdactScreenState();
}

class _ProdactScreenState extends State<ForgetScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            child: AppCustomer(
              "نسيت كلمة المرور",
            ),
            preferredSize: const Size(double.infinity, 60),
          ),
          //resizeToAvoidBottomInset: false,
          body: Container(
              child: Column(children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            height: 60,
                            width: 300,
                            child: TextFormField(
                                textAlign: TextAlign.center,
                                onChanged: (value) async {},
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "ادخل البريد الكتروني ",
                                    hintStyle: GoogleFonts.cairo(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white)),
                        SizedBox(height: 10),
                        CustomButton(text: "ارسال"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ])),
        ),
      ),
    );
  }
}
