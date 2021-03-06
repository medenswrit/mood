import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mood/constants/db_constants.dart';
import 'package:mood/data/models/custom_error.dart';
import 'package:mood/data/models/user_model.dart';
import 'package:mood/data/repositories/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit({
    required this.profileRepository,
  }) : super(ProfileState.initial());

  Future<void> getProfile({required String uid}) async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));

    try {
      final User user = await profileRepository.getProfile(uid: uid);
      emit(state.copyWith(
        profileStatus: ProfileStatus.loaded,
        user: user,
      ));
    } on CustomError catch (e) {
      emit(state.copyWith(
        profileStatus: ProfileStatus.error,
        error: e,
      ));
    }
  }

  Future<void> setNotificationsStatus(
      {required String uid, required bool notifications}) async {
    await usersReference.doc(uid).update({'notifications': notifications});
  }
}
