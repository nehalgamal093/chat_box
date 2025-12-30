part of 'user_profile_bloc.dart';

enum ProfileStates { initial, loading, success, failed }

class UserProfileState {
  ProfileStates? profileStates;
  User? userProfile;
  String? status;
  AppFailures? failures;

  UserProfileState({
    this.profileStates,
    this.userProfile,
    this.failures,
    this.status,
  });
  UserProfileState copyWith({
    ProfileStates? profileStates,
    User? userProfile,
    AppFailures? failures,
    String? status,
  }) {
    return UserProfileState(
      profileStates: profileStates ?? this.profileStates,
      userProfile: userProfile ?? this.userProfile,
      failures: failures ?? this.failures,
      status: status ?? this.status,
    );
  }
}

final class UserProfileInitial extends UserProfileState {
  UserProfileInitial() : super(profileStates: ProfileStates.initial);
}
