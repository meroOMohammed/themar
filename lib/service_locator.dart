

import 'package:get_it/get_it.dart';
import 'package:themar/core/dio_helper.dart';
import 'package:themar/views/products/components/slider/cubit.dart';

import 'views/contact_us/bloc.dart';
import 'views/login/cubit.dart';
import 'views/products/components/category_section/cubit.dart';
import 'views/products/components/products/cubit.dart';
import 'views/terms/cubit.dart';

void initServerLocator(){
 final container = GetIt.instance;
 // final container = GetIt.instance;

 container.registerSingleton(DioHelper());


 container.registerFactory(() => LoginCubit(GetIt.I<DioHelper>()));
 container.registerFactory(() => TermsCubit(GetIt.I<DioHelper>())..getData());
 container.registerFactory(() =>  CategoriesCubit(GetIt.I<DioHelper>())..getData());
 container.registerFactory(() => ProductsCubit(GetIt.I<DioHelper>())..getData());
 container.registerFactory(() => ContactUsBloc(GetIt.I<DioHelper>()));
 container.registerFactory(() => SliderCubit(GetIt.I<DioHelper>())..getData());
}