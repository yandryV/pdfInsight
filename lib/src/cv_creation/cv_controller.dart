import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../utils.dart';
import 'cv_model.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';

class CvController {
  CvModel model;

  CvController() : model = CvModel();

  void updateValue(String property, int index, dynamic value) {
    if (property == 'name') {
      model.name = value;
    } else if (property == 'profession') {
      model.profession = value;
    } else if (property == 'email') {
      model.email = value;
    } else if (property == 'phone') {
      model.phone = value;
    } else if (property == 'country') {
      model.country = value;
    } else if (property == 'github') {
      model.github = value;
    } else if (property == 'linkedin') {
      model.linkedin = value;
    } else if (property == 'experienceTitle' &&
        index >= 0 &&
        index < model.experiences.length) {
      model.experiences[index].company = value;
    } else if (property == 'experienceStartDate' &&
        index >= 0 &&
        index < model.experiences.length) {
      model.experiences[index].startDate = value;
    } else if (property == 'experienceEndDate' &&
        index >= 0 &&
        index < model.experiences.length) {
      model.experiences[index].endDate = value;
    } else if (property == 'experienceDescription' &&
        index >= 0 &&
        index < model.experiences.length) {
      model.experiences[index].description = value;
    } else if (property == 'educationAcademy' &&
        index >= 0 &&
        index < model.educations.length) {
      model.educations[index].academy = value;
    } else if (property == 'educationStartDate' &&
        index >= 0 &&
        index < model.educations.length) {
      model.educations[index].startDate = value;
    } else if (property == 'educationEndDate' &&
        index >= 0 &&
        index < model.educations.length) {
      model.educations[index].endDate = value;
    } else if (property == 'educationDescription' &&
        index >= 0 &&
        index < model.educations.length) {
      model.educations[index].description = value;
    } else if (property == 'language' &&
        index >= 0 &&
        index < model.languages.length) {
      model.languages[index].language = value;
    } else if (property == 'skill' &&
        index >= 0 &&
        index < model.skills.length) {
      model.skills[index].skill = value;
    }
  }

  void addItem(dynamic item) {
    if (item is Experience) {
      model.experiences.add(item);
    } else if (item is Education) {
      model.educations.add(item);
    } else if (item is Language) {
      model.languages.add(item);
    } else if (item is Skill) {
      model.skills.add(item);
    }
  }

  void removeLastItem(String property) {
    if (property == 'experience' && model.experiences.isNotEmpty) {
      model.experiences.removeLast();
    } else if (property == 'language' && model.languages.isNotEmpty) {
      model.languages.removeLast();
    } else if (property == 'education' && model.educations.isNotEmpty) {
      model.educations.removeLast();
    } else if (property == 'skill' && model.skills.isNotEmpty) {
      model.skills.removeLast();
    }
  }

  Future<void> savePdf() async {
    final pdf = pw.Document();

    // Generar el contenido del PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              model.name.toUpperCase(),
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              model.profession,
              style: const pw.TextStyle(fontSize: 12),
            ),
            pw.Container(
              width: 200,
              child: pw.Divider(
                thickness: 1.3,
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Text(
              model.email,
              style: const pw.TextStyle(fontSize: 10),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              model.phone.toString(),
              style: const pw.TextStyle(fontSize: 10),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              model.country,
              style: const pw.TextStyle(fontSize: 10),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              model.github,
              style: const pw.TextStyle(fontSize: 10),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              model.linkedin,
              style: const pw.TextStyle(fontSize: 10),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              'Experiencia Profesional',
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 1.3,
            ),
            for (var experience in model.experiences)
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Column(
                    children: [
                      pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            '${DateFormat('MMM yyyy').format(experience.startDate)} - ',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                          pw.Text(
                            DateFormat('MMM yyyy').format(experience.endDate),
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.SizedBox(width: 10),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment
                        .start, // Alinea el texto de la descripción desde el inicio
                    children: [
                      pw.Text(
                        experience.company,
                        style: pw.TextStyle(
                          fontSize: 10,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        experience.description,
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 10),
                ],
              ),
            pw.SizedBox(height: 20),
            pw.Text(
              'Educación:',
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 1.3,
            ),
            for (var education in model.educations)
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Column(
                    children: [
                      pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            '${DateFormat('MMM yyyy').format(education.startDate)} - ',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                          pw.Text(
                            DateFormat('MMM yyyy').format(education.endDate),
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.SizedBox(width: 10),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment
                        .start, // Alinea el texto de la descripción desde el inicio
                    children: [
                      pw.Text(
                        education.academy,
                        style: pw.TextStyle(
                          fontSize: 10,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        education.description,
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 10),
                ],
              ),
            pw.SizedBox(height: 20),
            pw.Text(
              'Habilidades:',
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 1.3,
            ),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < model.skills.length; i++)
                  pw.Text(
                    '${model.skills[i].skill}${(i != model.skills.length - 1) ? ', ' : ''}',
                    style: const pw.TextStyle(
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              'Idiomas:',
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(
              thickness: 1.3,
            ),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < model.languages.length; i++)
                  pw.Text(
                    '${model.languages[i].language}${(i != model.skills.length - 1) ? ', ' : ''}',
                    style: const pw.TextStyle(
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );

    // Mostrar el diálogo de selección de archivo
    final directory = await getApplicationDocumentsDirectory();
    final suggestedFileName = 'CV_${model.name}.pdf';

    String? filePath = await FilePicker.platform.saveFile(
      initialDirectory: directory.path,
      fileName: suggestedFileName,
      allowedExtensions: ['pdf'],
    );

    if (filePath != null) {
      // Guardar el archivo PDF en la ubicación seleccionada
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      // Mostrar un mensaje de confirmación
    }
  }
}
