import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/dio_helper.dart';

part 'model.dart';
part 'states.dart';
class ProductsCubit extends Cubit<ProductsState> {

  final DioHelper _dio ;
  ProductsCubit(this._dio) : super(GetProductsLoadingState());

  // late ProductData model;

  Future<void> getData() async {
    // await Future.delayed(const Duration(seconds: 3));
    final response = await _dio.get("products");
    if (response.isSuccess) {
      final list = ProductData.fromJson(response.data).list;
      emit(GetProductsSuccessState(list: list));
    } else {
      emit(GetProductsFailedState(msg: response.message!));
    }
  }
}
