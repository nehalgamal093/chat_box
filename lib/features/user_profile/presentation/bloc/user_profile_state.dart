part of 'user_profile_bloc.dart';

enum ProfileStates { initial, loading, success, failed }

class UserProfileState {
  ProfileStates? profileStates;
  UserProfile? userProfile;
  AppFailures? failures;

  UserProfileState({this.profileStates, this.userProfile, this.failures});
  UserProfileState copyWith({
    ProfileStates? profileStates,
    UserProfile? userProfile,
    AppFailures? failures,
  }) {
    return UserProfileState(
      profileStates: profileStates ?? this.profileStates,
      userProfile: userProfile ?? this.userProfile,
      failures: failures ?? this.failures,
    );
  }
}

final class UserProfileInitial extends UserProfileState {
  UserProfileInitial() : super(profileStates: ProfileStates.initial);
}
