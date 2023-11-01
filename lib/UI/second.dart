import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class second extends StatefulWidget {
  final String image;
  final String tile;
  final String description;
  const second({Key? key,required this.image,required this.tile,required this.description}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Container(
              width: 414.w,
              height: 280.h,
              color: Colors.black,
              child: Image.network(widget.image)),
          SizedBox(height: 30.h,),
      Container(
        width: 414.w,
        height: 200.h,
        color: Colors.black,
      child:Padding(
        padding:  EdgeInsets.only(left: 50.w),
        child: Text(
          widget.tile,
          style: TextStyle(
            color: Colors.white,
            fontSize: 65.sp,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
        ),
          SizedBox(height: 30.h,),
          Container(
            width: 414.w,
            height: 250.h,
            color: Colors.black,
            child: Padding(
              padding:  EdgeInsets.only(left: 50.w),
              child: Text(
              widget.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
