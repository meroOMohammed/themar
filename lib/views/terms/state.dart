import 'package:themar/views/terms/model.dart';

class TermsStates{}

class GetTermsLoadingState extends TermsStates{}
class GetTermsSuccessState extends TermsStates{
  final TermsModel model ;

  GetTermsSuccessState({required this.model});
}
class GetTermsFailedState extends TermsStates{

}