import 'package:flutter/material.dart';
import 'package:pdf_insight/cv_creation.dart';
import 'package:pdf_insight/pdf_viewer_page.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:pdf_insight/preferences_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late SharedPreferences preferences;

  File? currentPdfFile;
  List<File> pdfFiles = [];
  List<String> pdfFileNames = [];

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    preferences = await SharedPreferences.getInstance();
    Map<String, Object?> initData = await InitializePreferences.initialize();
    List<File> loadedPdfFiles = initData['pdfFiles'] as List<File>;
    List<String> loadedPdfFileNames = initData['pdfFileNames'] as List<String>;
    File? loadedCurrentPdfFile = initData['currentPdfFile'] as File?;

    setState(() {
      pdfFiles = loadedPdfFiles;
      pdfFileNames = loadedPdfFileNames;
      currentPdfFile = loadedCurrentPdfFile;
    });
  }

  Future<void> openFilePicker() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        File pdfFile = File(result.files.single.path!);
        setState(() {
          currentPdfFile = pdfFile;
          pdfFiles.insert(0, pdfFile);
        });

        await saveSelectedFilePath(pdfFile.path);

        navigateToPDFViewer(pdfFile);
      }
    } catch (e) {
      // print('Error selecting PDF: $e');
    }
  }

  Future<void> navigateToPDFViewer(File pdfFile) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerPage(
          pdfFile: pdfFile,
          pdfName: path.basename(pdfFile.path),
        ),
      ),
    );
  }

  Future<void> saveSelectedFilePath(String filePath) async {
    List<String> savedFilePaths =
        preferences.getStringList('selectedFilePaths') ?? [];
    savedFilePaths.insert(0, filePath);
    await preferences.setStringList('selectedFilePaths', savedFilePaths);
  }

  Future<List<String>> getSelectedFilePaths() async {
    return preferences.getStringList('selectedFilePaths') ?? [];
  }

  Future<void> renamePdfFile(File pdfFile, String newName) async {
    try {
      final directory = pdfFile.parent;
      final newPath = path.join(directory.path, newName);
      final newFile = pdfFile.renameSync(newPath);

      // Actualizar la referencia al archivo renombrado en la lista pdfFiles
      setState(() {
        int index = pdfFiles.indexOf(pdfFile);
        pdfFiles[index] = newFile;

        // Actualizar el nombre de archivo en la lista pdfFileNames
        pdfFileNames[index] = newName;
      });

      // Actualizar la ruta de archivo en las preferencias compartidas
      updateSelectedFilePath(pdfFile.path, newFile.path);
    } catch (e) {
      // print('Error al renombrar el archivo: $e');
    }
  }

  Future<void> updateSelectedFilePath(String oldPath, String newPath) async {
    List<String> savedFilePaths =
        preferences.getStringList('selectedFilePaths') ?? [];
    int index = savedFilePaths.indexOf(oldPath);
    if (index != -1) {
      savedFilePaths[index] = newPath;
      await preferences.setStringList('selectedFilePaths', savedFilePaths);
    }
  }

  Future<void> removePdfFile(File pdfFile) async {
    await removeSelectedFilePath(pdfFile.path);
    setState(() {
      pdfFiles.remove(pdfFile);
    });
  }

  Future<void> removeSelectedFilePath(String filePath) async {
    List<String> savedFilePaths =
        preferences.getStringList('selectedFilePaths') ?? [];
    savedFilePaths.remove(filePath);
    await preferences.setStringList('selectedFilePaths', savedFilePaths);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 115,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CvCreationPage(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.description),
                      Text('Crear CV'),
                    ],
                  )),
            ),
            const Text(
              'Agregados recientemente',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(pdfFiles.length, (index) {
                      File pdfFile = pdfFiles[index];
                      String fileName = path.basename(pdfFile.path);
                      TextEditingController textController =
                          TextEditingController(text: fileName);

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PDFViewerPage(
                                pdfFile: pdfFile,
                                pdfName: fileName,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 220,
                          height: 250,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(47, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.picture_as_pdf,
                                  color: Colors.purpleAccent,
                                  size: 75,
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: textController,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                            textAlign: TextAlign.center,
                                            onSubmitted: (value) {
                                              String newName =
                                                  textController.text.trim();
                                              renamePdfFile(pdfFile, newName);
                                            },
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              isDense: true,
                                            ),
                                          ),
                                          Text(
                                            pdfFile.path,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuButton<String>(
                                      onSelected: (value) {
                                        if (value == 'renombrar') {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Renombrar archivo'),
                                                content: TextField(
                                                  controller: textController,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'Nuevo nombre',
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child:
                                                        const Text('Cancelar'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      String newName =
                                                          textController.text
                                                              .trim();
                                                      renamePdfFile(
                                                          pdfFile, newName);
                                                      Navigator.pop(context);
                                                    },
                                                    child:
                                                        const Text('Renombrar'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else if (value == 'quitar') {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Quitar archivo'),
                                                content: const Text(
                                                    '¿Estás seguro de que quieres quitar este archivo?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child:
                                                        const Text('Cancelar'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      removePdfFile(pdfFile);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Quitar'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        const PopupMenuItem<String>(
                                          value: 'renombrar',
                                          child: Text('Renombrar'),
                                        ),
                                        const PopupMenuItem<String>(
                                          value: 'quitar',
                                          child: Text('Quitar'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openFilePicker,
        child: const Icon(Icons.open_in_browser),
      ),
    );
  }
}
