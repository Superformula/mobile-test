import 'package:flutter/material.dart';
import 'package:sf_qr_code/features/qr/ui/qr_page.dart';
import 'package:sf_qr_code/features/scan/scan_page.dart';
import 'package:sf_qr_code/themes/app_colors.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Wrap(
                children: [
                  dashBox(
                    title: "QR Code",
                    icon: Icons.qr_code_2_outlined,
                    boxBg: AppColors.yellowAccent,
                    circleBg: AppColors.yellowLite,
                    fg: AppColors.yellowDark,
                    nextPage: QRPage(),
                  ),
                  dashBox(
                    title: "Scan Page",
                    icon: Icons.document_scanner_outlined,
                    boxBg: AppColors.greenishAccent,
                    circleBg: AppColors.greenishLite,
                    fg: AppColors.greenishDark,
                    nextPage: ScanPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashBox({
    required String title,
    required IconData icon,
    required Color boxBg,
    required Color circleBg,
    required Color fg,
    required Widget nextPage,
  }) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        // Using Material Page Route 
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => nextPage));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: circleBg,
              radius: 30,
              child: Icon(icon, color: fg, size: 35),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(title, style: TextStyle(fontSize: 15, color: fg)),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: boxBg,
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
