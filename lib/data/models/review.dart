class Review {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //

  final int id, userRating;
  final String? userName,
      userProfileImg,
      userComment,
      userCommentTime,
      storeComment,
      storeCommentTime;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  Review(
      {this.id = 0,
      this.userRating = 0,
      this.userName = "",
      this.userProfileImg = "",
      this.userComment = "",
      this.userCommentTime = "",
      this.storeComment = "",
      this.storeCommentTime = ""});

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        'id': id,
        'userRating': userRating,
        'userName': userName,
        'userProfileImg': userProfileImg,
        'userComment': userComment,
        'userCommentTime': userCommentTime,
        'storeComment': storeComment,
        'storeCommentTime': storeCommentTime
      };

  // - - - - - - - - - - - - - - - - - - FROM JSON- - - - - - - - - - - - - - - - - -  //
  static Review fromJson(Map json) {
    return Review(
        id: json['id'],
        userRating: json['userRating'],
        userName: json['userName'],
        userProfileImg: json['userProfileImg'],
        userComment: json['userComment'],
        userCommentTime: json['userCommentTime'],
        storeComment: json['storeComment'],
        storeCommentTime: json['storeCommentTime']);
  }
}
