import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/dio_helper.dart';

part 'states.dart';
part 'model.dart';

class SliderCubit extends Cubit<SliderState> {

  final DioHelper _dio ;
  SliderCubit(this._dio) : super(GetSliderLoadingState());

  Future<void> getData() async {
    // await Future.delayed(const Duration(seconds: 3));
    final response = await _dio.get("sliders");
    if (response.isSuccess) {
      final list = SliderData.fromJson(response.data).list;
      emit(GetSliderSuccessState(list: list));
    } else {
      emit(GetSliderFailedState(msg: response.message!));
    }
  }
}
