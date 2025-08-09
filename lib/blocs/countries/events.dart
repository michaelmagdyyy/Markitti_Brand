class CountriesEvent {}

class StartCountriesEvent extends CountriesEvent {
  final bool openSheet;
  StartCountriesEvent([this.openSheet=false]);
}
