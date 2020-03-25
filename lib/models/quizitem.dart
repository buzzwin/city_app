class QuizItem{
  final int itemIndex;
  final String question;
  final List answers;

  QuizItem({this.itemIndex, this.question, this.answers});
  @override
  String toString() {
    // TODO: implement toString
    return itemIndex.toString() + question + answers.toString();
    //return super.toString();
  }

}
