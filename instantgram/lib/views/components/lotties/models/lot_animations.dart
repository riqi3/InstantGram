enum LottieAnimation {
  dataNotFound(name: 'data_not_found'),
  empty(name: 'empty'),
  error(name: 'error'),
  uploading(name: 'uploading'),
  loading(name: 'loading');

  final String name;
  const LottieAnimation({
    required this.name,
  });
}
