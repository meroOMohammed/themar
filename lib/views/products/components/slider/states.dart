part of 'cubit.dart';
class SliderState {}

class GetSliderLoadingState extends SliderState {}

class GetSliderFailedState extends SliderState {
  final String msg;

  GetSliderFailedState({required this.msg});
}

class GetSliderSuccessState extends SliderState {
  final List<SliderModel> list;

  GetSliderSuccessState({required this.list});
}
