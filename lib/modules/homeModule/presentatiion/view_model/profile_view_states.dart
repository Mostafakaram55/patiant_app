abstract class ProfileCubitStates{}
class ProfileCubitInitialStates extends ProfileCubitStates{}
class ProfileCubitLoadingStates extends ProfileCubitStates{}
class ProfileCubitSuccessStates extends ProfileCubitStates{}
class ProfileCubitErrorStates extends ProfileCubitStates{
  final String error;

  ProfileCubitErrorStates({required this.error});
}
