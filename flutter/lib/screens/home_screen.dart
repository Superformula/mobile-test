//Flutter Packages
import 'package:flutter/material.dart';

//My Packages
import '../widgets/action_button.dart';
import '../widgets/expandable_fab.dart';

//Third party packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: ExpandableFab(
        distance: ScreenUtil().setHeight(90),
        children: [
          ActionButton(
            onPressed: () => (){},
            icon: const Icon(Icons.qr_code),
          ),
          ActionButton(
            onPressed: () => (){},
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),

    );
  }
}
