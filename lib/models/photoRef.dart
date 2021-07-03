class PhotoRef {
  final Map photosReference;

  PhotoRef({this.photosReference});

  factory PhotoRef.fromJson(Map<dynamic, dynamic> parsedJson) {
    return PhotoRef(
      photosReference: parsedJson['photo_reference'] as Map,
    );
  }
}
