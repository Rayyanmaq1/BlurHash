class BlurImage {
  String hash;
  String url;
  String filepath;

  BlurImage({this.hash, this.url, this.filepath});

  factory BlurImage.queryDocumentSnapshot(snapshot) {
    return BlurImage(
        hash: snapshot["hash"],
        url: snapshot["url"],
        filepath: snapshot["filePath"]);
  }

  Map<String, dynamic> toJson(BlurImage blurImage) => {
        "hash": blurImage.hash,
        "url": blurImage.url,
        "filePath": blurImage.filepath
      };
}
