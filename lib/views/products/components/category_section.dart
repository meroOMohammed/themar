import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/dio_helper.dart';
import 'category_section/cubit.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  bool isLoading = true;
  bool isFailed = false;
  late List< CategoryModel> list;
  String? errorMessage;
  late CustomResponse response;

  Future<void> getData() async {
    response = await DioHelper().get("categories");
    if (response.isSuccess) {
      list = CategoriesData.fromJson(response.data).list;
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (!response.isSuccess) {
      return Column(children: [
        Text(response.message ?? "Failed Try Again Later"),
        FilledButton(
          onPressed: () {
            isLoading = true;
            setState(() {});
            getData();
          },
          child: const Text("Try Again"),
        )
      ]);
    } else if (list.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 128.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Text(
              "الأقسام.",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              itemBuilder: (context, index) => SizedBox(
                height: 100.h, // Set a fixed height for each item
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                        list[index].image,
                        height: 70.h,
                        fit: BoxFit.cover,
                        width: 70.w,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      list[index].name,
                      style:
                          TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(width: 24.w),
              itemCount: list.length,
            ),
          )
        ],
      ),
    );
  }
}
