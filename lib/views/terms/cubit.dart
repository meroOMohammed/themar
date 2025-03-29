import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/dio_helper.dart';
import 'package:themar/views/terms/model.dart';
import 'package:themar/views/terms/state.dart';

class TermsCubit extends Cubit<TermsStates> {

  final DioHelper _dio ;

  TermsCubit(this._dio) : super(GetTermsLoadingState());
  late TermsModel model;

  Future<void> getData() async {
    final response = await _dio.get("terms");
    if (response.isSuccess) {
      model = TermsData.fromJson(response.data).model;
      emit(GetTermsSuccessState(model: model));
    } else {
      GetTermsFailedState();
    }
  }
}
