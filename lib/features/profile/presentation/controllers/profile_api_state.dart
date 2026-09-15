enum ProfileApiStatus { initial, loading, success, failure }

class ProfileApiState<T> {
  final ProfileApiStatus status;
  final T? data;
  final String? errorMessage;

  const ProfileApiState({
    this.status = ProfileApiStatus.initial,
    this.data,
    this.errorMessage,
  });

  const ProfileApiState.initial()
    : status = ProfileApiStatus.initial,
      data = null,
      errorMessage = null;

  const ProfileApiState.loading()
    : status = ProfileApiStatus.loading,
      data = null,
      errorMessage = null;

  const ProfileApiState.success(T value)
    : status = ProfileApiStatus.success,
      data = value,
      errorMessage = null;

  const ProfileApiState.failure(String message)
    : status = ProfileApiStatus.failure,
      data = null,
      errorMessage = message;

  bool get isInitial => status == ProfileApiStatus.initial;

  bool get isLoading => status == ProfileApiStatus.loading;

  bool get isSuccess => status == ProfileApiStatus.success;

  bool get isFailure => status == ProfileApiStatus.failure;
}
