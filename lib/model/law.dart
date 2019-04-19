class Law {
  final String id;
  final String name;
  final List<String> subTitle;
  final List<String> content;
  final String imageURL;
  final String color;

  const Law({
    this.id,
    this.name,
    this.subTitle,
    this.content,
    this.imageURL,
    this.color
  });

  Law.fromMap(Map<String, dynamic> data, String id)
      : this(
          id: id,
          name: data['name'],    
          subTitle: new List<String>.from(data['subTitle']),
          content: new List<String>.from(data['content']),
          imageURL: data['image'],
          color: data['color'],
        );
}