import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar/core/helper_methods.dart';
import 'package:themar/service_locator.dart';
import 'package:themar/views/my_map.dart';
import 'package:themar/views/products/view.dart';

List<Color> colors = [
  const Color(0xffFFEFEF),
  const Color(0xffF3D0D7),
  const Color(0xffF0EBE3),
  const Color(0xffF6F5F2)
];

void main() {
  initServerLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
     designSize: Size(430, 932),
     child: const ProductsView(),
   builder: (context,child)=>  MaterialApp(
   title: "Themar",
   navigatorKey: navigatorKey,
   debugShowCheckedModeBanner: false,
   theme: ThemeData(
   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    inputDecorationTheme:
    const InputDecorationTheme(border: OutlineInputBorder())),
    home:  child,
    // home: Scaffold(
    //     body: PageView.builder(
    //   itemBuilder: (context, index) => Container(
    //     color: colors[index],
    //     child: Center(
    //       child: Text("$index"),
    //     ),
    //   ),
    //   itemCount: colors.length,
    // )),
    )
   );
  }
}
