
import 'package:untitled11/models/search_model.dart';

abstract class SearchStates{}
class SearchInitialStates extends SearchStates{}

class SearchLoadingStates extends SearchStates {}
class SearchSuccessStates extends SearchStates {
  final SearchModel model;

  SearchSuccessStates(this.model);
}
class SearchErrorStates extends SearchStates {}