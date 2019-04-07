class Comment {
  final String id;
  final String user;
  final String content;
  final String date;

  const Comment({
    this.id,
    this.user,
    this.content,
    this.date
  });

  Comment.fromMap(Map<String, dynamic> data, String id)
      : this(
          id: id,
          user: data['user'],    
          content: data['content'], 
          date: data['date'], 
        );
  Map<String, dynamic> toJson() =>
  {
    'user': user,
    'content': content,
    'date':date,
  };
}