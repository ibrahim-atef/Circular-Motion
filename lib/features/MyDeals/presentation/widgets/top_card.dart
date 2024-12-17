import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopCards extends StatelessWidget {
  const TopCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildRottedCard(),
          _buildCard(),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            width: 163.w,
            height: 125.h,
            decoration: BoxDecoration(
              color: Color(0xff084A72),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned(
              left: 0, top: 0, child: _buildImage("assets/imgs/topleft.png")),
          Positioned(
            right: 0,
            top: 0,
            child: _buildImage("assets/imgs/topright.png"),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: _buildImage("assets/imgs/bottom.png"),
          ),
          Container(
            width: 163.w,
            height: 125.h,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("صفقاتي النشطة",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    SizedBox(width: 8),
                    _buildImage("assets/icons/Frame 1000009589.png"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" صفقات ",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    Text("10",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRottedCard() {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            width: 163.w,
            height: 125.h,
            decoration: BoxDecoration(
              color: Color(0xff006AA7),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned(
              left: 0, top: 0, child: _buildImage("assets/imgs/Group 22.png")),
          Positioned(
            right: 0,
            top: 0,
            child: _buildImage("assets/imgs/Group 23.png"),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: _buildImage("assets/imgs/Group 1000007639.png"),
          ),
          Container(
            width: 163.w,
            height: 125.h,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("الأرباح المتوقعة",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    SizedBox(width: 8),
                    _buildImage("assets/icons/Finance Icons.png"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ج.م ",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    Text("30000",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImage(
    String imagePath,
  ) {
    return Image.asset(
      imagePath,
      fit: BoxFit.contain,
    );
  }
}
