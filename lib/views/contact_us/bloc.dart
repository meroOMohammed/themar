import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/dio_helper.dart';

part 'events.dart';
part 'states.dart';

class ContactUsBloc extends Bloc<ContactUsEvents, ContactUsStates> {
  final DioHelper _dio ;

  ContactUsBloc(this._dio) : super(ContactUsStates()){
    on<SendContactUsEvent>(_sendData);
  }

  final nameController = TextEditingController(text: "Mirvat");
  final phoneController = TextEditingController(text: "20910348758");
  final titleController = TextEditingController(text: "Hello");
  final bodyController = TextEditingController(text: "How are you");

   Future<void> _sendData(
      SendContactUsEvent event,
      Emitter<ContactUsStates> emit,)
  async{
    emit(SendContactUsLoadingState());
  final response =await _dio.send("contact", data: {
  "fullname":nameController.text,
  "phone":phoneController.text,
  "title":titleController.text,
  "content":bodyController.text
  });
  if (response.isSuccess){
  emit(SendContactUsSuccessState(msg: "Success"));
  }
  else{
  emit(SendContactUsFailedState(msg: response.message!));
  } }}

