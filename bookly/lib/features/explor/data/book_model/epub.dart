class Epub {
  bool? isAvailable;

  Epub({this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json['isAvailable'] as bool?,
      );
}
