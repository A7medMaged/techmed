import 'package:bloc/bloc.dart';
import 'package:techmed/features/medication/data/models/medication_details/medication_details.dart';
import 'package:techmed/features/medication/data/models/medication_model/medication_model.dart';
import 'package:techmed/features/medication/data/models/medication_request.dart';
import 'package:techmed/features/medication/data/repos/medication_repo.dart';

part 'medication_state.dart';

class MedicationCubit extends Cubit<MedicationState> {
  MedicationCubit(this._medicationRepo) : super(MedicationInitial());
  final MedicationRepo _medicationRepo;
  Future<void> fetchMedications() async {
    emit(MedicationLoading());
    final result = await _medicationRepo.getMedications();
    result.fold(
      (l) => emit(MedicationFailure(l.error)),
      (r) => emit(MedicationSuccess(r)),
    );
  }

  Future<void> createMedication(MedicationRequest medicationRequest) async {
    emit(CreateMedicationLoading());
    final result = await _medicationRepo.addMedications(medicationRequest);
    result.fold(
      (l) => emit(CreateMedicationFailure(l.error)),
      (r) => emit(CreateMedicationSuccess()),
    );
  }

  Future<void> fetchSingleMedications(
    int medicationId,
  ) async {
    emit(SingleMedicationLoading());
    final result = await _medicationRepo.getSingleVaccination(medicationId);
    result.fold(
      (l) => emit(SingleMedicationFailure(l.error)),
      (r) => emit(SingleMedicationSuccess(r)),
    );
  }

  Future<void> deleteMedication(int medicationId) async {
    emit(DeleteMedicationLoading());
    final result = await _medicationRepo.deleteMedications(medicationId);
    result.fold(
      (l) => emit(DeleteMedicationFailure(l.error)),
      (r) => emit(DeleteMedicationSuccess()),
    );
  }
}
