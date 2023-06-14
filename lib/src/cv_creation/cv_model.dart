import '../../utils.dart';

class CvModel {
  String name;
  String profession;
  String email;
  int? phone;
  String country;
  String github;
  String linkedin;
  List<Experience> experiences;
  List<Education> educations;
  List<Skill> skills;
  List<Language> languages;

  CvModel({
    this.name = '',
    this.profession = '',
    this.email = '',
    this.phone,
    this.country = '',
    this.github = '',
    this.linkedin = '',
    List<Experience>? experiences,
    List<Education>? educations,
    List<Skill>? skills,
    List<Language>? languages,
  })  : experiences = experiences ?? [],
        educations = educations ?? [],
        skills = skills ?? [],
        languages = languages ?? [];
}
