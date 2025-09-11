import 'package:bloc/bloc.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_details/vaccination_details.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_model/vaccination_model.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_request.dart';
import 'package:techmed/features/vaccination/data/repos/vaccination_repo.dart';

part 'vaccination_state.dart';

class VaccinationCubit extends Cubit<VaccinationState> {
  VaccinationCubit(this._vaccinationRepo) : super(VaccinationInitial());
  final VaccinationRepo _vaccinationRepo;

  Future<void> getVaccinations() async {
    emit(VaccinationLoading());
    final result = await _vaccinationRepo.getVaccination();
    result.fold(
      (l) => emit(VaccinationError(l.error)),
      (r) => emit(VaccinationSuccess(r)),
    );
  }

  Future<void> addVaccination(
    VaccinationRequest vaccinationRequest,
  ) async {
    emit(CreateVaccinationLoading());
    final result = await _vaccinationRepo.addVaccination(vaccinationRequest);
    result.fold(
      (l) => emit(CreateVaccinationError(l.error)),
      (r) => emit(CreateVaccinationSuccess()),
    );
  }

  Future<void> deleteVaccination(int vaccinationId) async {
    emit(DeleteVaccinationLoading());
    final result = await _vaccinationRepo.deleteVaccination(vaccinationId);
    result.fold(
      (l) => emit(DeleteVaccinationError(l.error)),
      (r) => emit(DeleteVaccinationSucecss()),
    );
  }

  Future<void> getSingleVaccination(int vaccinationId) async {
    emit(SingleVaccinationLoading());
    final result = await _vaccinationRepo.getSingleVaccination(vaccinationId);
    result.fold(
      (l) => emit(SingleVaccinationError(l.error)),
      (r) => emit(SingleVaccinationSuccess(r)),
    );
  }
}
