part of 'cubit.dart';

class ProductsState {}

class GetProductsLoadingState extends ProductsState {}

class GetProductsFailedState extends ProductsState {
  final String msg;

  GetProductsFailedState({required this.msg});
}

class GetProductsSuccessState extends ProductsState {
  final List<ProductModel> list;

  GetProductsSuccessState({required this.list});
}
