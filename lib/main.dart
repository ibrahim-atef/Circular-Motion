import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/MainLayout/presentation/view/main_layout_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 852),
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        ensureScreenSize: true,
     builder: (context,  child) {

       return  MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'My Deals App',
         theme: ThemeData(
           fontFamily: 'Cairo',
           // Set Cairo as the global font
           primarySwatch: Colors.blue,
           textTheme: const TextTheme(
             displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
             // ExtraBold
             displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
             // Bold
             displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
             // Medium
             bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
             // Regular
             bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
             // Regular
             labelLarge: TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.w700,
                 fontStyle: FontStyle.italic), // BoldItalic
           ),
           bottomNavigationBarTheme: const BottomNavigationBarThemeData(
               selectedItemColor: Color(0xff1007FA)),
         ),
         home: const MainLayoutScreenView(),
       );
     }
    );
  }
}
