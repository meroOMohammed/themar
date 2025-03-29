import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:themar/core/design/app_shimmer.dart';

import 'cubit.dart';

part 'loading.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({super.key});

  @override
  State<SliderSection> createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  final cubit = GetIt.I<SliderCubit>();

  int currentIndex = 0;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is GetSliderFailedState) {
          return const Text("Failed");
        } else if (state is GetSliderSuccessState) {
          return Container(
            height: 232,
            margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        currentIndex = index;
                        setState(() {});
                      },
                    ),
                    itemBuilder: (context, index, realIndex) =>
                        Image.network(state.list[index].image),
                    itemCount: state.list.length,
                  ),
                )),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding:
                          EdgeInsetsDirectional.only(end: index != 4 ? 8 : 0),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: const Color(0xff16A124)
                            .withOpacity(index == currentIndex ? 1 : 0.10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const _Loading();
        }
      },
    );
  }
}
