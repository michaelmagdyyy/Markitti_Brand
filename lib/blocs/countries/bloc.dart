import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/server_gate.dart';
import '../../core/utils/enums.dart';
import '../../models/country.dart';
import 'events.dart';
import 'states.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc() : super(CountriesState()) {
    on<StartCountriesEvent>(_fun);
  }

  List<CountryModel> counties = [];

  Future<void> _fun(StartCountriesEvent event, Emitter<CountriesState> emit) async {
    emit(state.copyWith(countriesState: RequestState.loading));
    final result = await ServerGate.i.getFromServer(url: 'general/countries');
    if (result.success) {
      counties = List<CountryModel>.from((result.data['data'] ?? []).map((e) => CountryModel.fromJson(e)));
      emit(state.copyWith(openSheet: event.openSheet, countriesState: RequestState.done));
    } else {
      emit(state.copyWith(countriesState: RequestState.error, msg: result.msg));
    }
  }
}
