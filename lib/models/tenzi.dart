
class Tenzi {
  late final String? titleEn; // English name
  late final String title;     //Swahili name
  late final int? titleNo;  // No ya Tenzi - (Same as ID)
  late final String verses;  // A string representation of All verses of a Tenzi in HTML
  Tenzi({required this.verses,required this.title, required this.titleNo, required this.titleEn});

  Tenzi.fromMap(Map<String, dynamic> res)
  {
    titleNo = res["title_no"];
    title = res["title"];
  verses = res["verses"];
  titleEn = res["title_en"];
  }

  Map<String, Object?> toMap() {
    return {'title_no':titleNo,'title': title, 'verses': verses, 'title_en': titleEn};
  }
}
