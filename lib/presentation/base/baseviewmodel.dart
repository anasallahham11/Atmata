abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs{
  ///shared variables and functions that will be used through any view model.
}

abstract class BaseViewModelInputs{
  void start(); //start view model job
  void dispose(); //view model dies
}
abstract class BaseViewModelOutputs{}