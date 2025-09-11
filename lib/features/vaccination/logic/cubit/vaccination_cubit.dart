import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_details/vaccination_details.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_model/vaccination_model.dart';

part 'vaccination_state.dart';

class VaccinationCubit extends Cubit<VaccinationState> {
  VaccinationCubit() : super(VaccinationInitial());
}
