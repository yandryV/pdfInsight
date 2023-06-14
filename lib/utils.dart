class Experience {
  String company;
  DateTime startDate;
  DateTime endDate;
  String description;

  Experience({
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.description,
  });
}

class Education {
  String academy;
  DateTime startDate;
  DateTime endDate;
  String description;

  Education({
    required this.academy,
    required this.startDate,
    required this.endDate,
    required this.description,
  });
}

class Skill {
  String skill;

  Skill({
    required this.skill,
  });
}

class Language {
  String language;

  Language({
    required this.language,
  });
}
