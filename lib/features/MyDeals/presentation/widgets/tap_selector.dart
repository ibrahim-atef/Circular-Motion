import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class  TabSelector extends StatelessWidget {
  const  TabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      child: ListView(
       scrollDirection: Axis.horizontal,


         children: [
           SizedBox(width: 8.w),
          _buildTab("صفقات جارية", true),
          SizedBox(width: 8.w),
          _buildTab("صفقات منتظرة", false),          SizedBox(width: 8.w),

           _buildTab("صفقات منتهية", false),
           SizedBox(width: 8.w),
        ],
      ),
    );
  }

  Widget _buildTab(String title, bool isActive) {
    return Container(

      height: 48.h,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color:   Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? Color(0xff1007FA) : Colors.grey.shade300,width: 1
        ),


      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Color(0xff1007FA) : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700 ,
              overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}