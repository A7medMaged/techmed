part of 'vaccination_cubit.dart';

abstract class VaccinationState {}

// States for fetching vaccinations

final class VaccinationInitial extends VaccinationState {}

final class VaccinationLoading extends VaccinationState {}

final class VaccinationSuccess extends VaccinationState {
  final VaccinationModel vaccinations;
  VaccinationSuccess(this.vaccinations);
}

final class VaccinationError extends VaccinationState {
  final String errorMessage;
  VaccinationError(this.errorMessage);
}

// States for creating a new vaccination

final class CreateVaccinationLoading extends VaccinationState {}

final class CreateVaccinationSuccess extends VaccinationState {}

final class CreateVaccinationError extends VaccinationState {
  final String errorMessage;
  CreateVaccinationError(this.errorMessage);
}

// States for deleting a vaccination

final class DeleteVaccinationLoading extends VaccinationState {}

final class DeleteVaccinationSucecss extends VaccinationState {}

final class DeleteVaccinationError extends VaccinationState {
  final String errorMessage;
  DeleteVaccinationError(this.errorMessage);
}

// State for fetching a single vaccination

final class SingleVaccinationLoading extends VaccinationState {}

final class SingleVaccinationSuccess extends VaccinationState {
  final VaccinationDetails vaccination;
  SingleVaccinationSuccess(this.vaccination);
}

final class SingleVaccinationError extends VaccinationState {
  final String errorMessage;
  SingleVaccinationError(this.errorMessage);
}
