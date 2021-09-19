
class Tenzi {
  late final String? titleEn; // English name
  late final String title;     //Swahili name
  late final int? titleNo;  // No ya Tenzi - (Same as ID)
  late final int isFavorite;  // Same as if_favorite COLUMN in DB
  late final String verses;  // A string rep of All verses of a Tenzi in HTML
  Tenzi({required this.verses,required this.title, required this.titleNo, required this.titleEn});

  /// fromMap constructor to change Map of Tenzi into tenzi object & returns IT
  /// Useful when needing to convert a tenzi map(return of a database query)
  /// into a real Tenzi object (for uses such as  in a ListView)
  Tenzi.fromMap(Map<String, dynamic> res)
  {
    titleNo = res["title_no"];
    title = res["title"];
  verses = res["verses"];
  titleEn = res["title_en"];
  isFavorite = res["is_favorite"];
  }

  // /// toMap method to change a tenzi object into a Map of Tenzi
  // /// Useful when needing to insert a tenzi object into a database
  // /// - Not usable in this project
  // Map<String, Object?> toMap() {
  //   return {'title_no':titleNo,'title': title, 'verses': verses, 'title_en': titleEn};
  // }
}
