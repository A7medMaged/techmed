part of 'medication_cubit.dart';

abstract class MedicationState {}

// States for fetching vaccinations

final class MedicationInitial extends MedicationState {}

final class MedicationLoading extends MedicationState {}

final class MedicationSuccess extends MedicationState {
  final MedicationModel medications;

  MedicationSuccess(this.medications);
}

final class MedicationFailure extends MedicationState {
  final String errorMessage;

  MedicationFailure(this.errorMessage);
}

// States for crete a new vaccination

final class CreateMedicationLoading extends MedicationState {}

final class CreateMedicationSuccess extends MedicationState {}

final class CreateMedicationFailure extends MedicationState {
  final String errorMessage;

  CreateMedicationFailure(this.errorMessage);
}

// States for deleting a medication

final class DeleteMedicationLoading extends MedicationState {}

final class DeleteMedicationSuccess extends MedicationState {}

final class DeleteMedicationFailure extends MedicationState {
  final String errorMessage;

  DeleteMedicationFailure(this.errorMessage);
}

// State for fetching a single medication

final class SingleMedicationLoading extends MedicationState {}

final class SingleMedicationSuccess extends MedicationState {
  final MedicationDetails medication;
  SingleMedicationSuccess(this.medication);
}

final class SingleMedicationFailure extends MedicationState {
  final String errorMessage;
  SingleMedicationFailure(this.errorMessage);
}
