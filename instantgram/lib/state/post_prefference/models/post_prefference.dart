enum PostPref{

 enableLikes(
    title: 'Allow likes',
    description:  'By allowing likes, users will be able to press the like button on your post.',
    storageK:'allow_likes',
  ),
  enableComments(
    title: 'Allow comments',
    description: 'By allowing comments, users will be able to comment on your post.',
    storageK: 'allow_comments',
  );



 final String title;
 final String description;
 final String storageK;
 const PostPref( {
   required this.title,
   required this.description,
   required this.storageK,
 });
}