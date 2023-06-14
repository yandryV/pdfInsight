import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdf_insight/src/cv_creation/cv_controller.dart';
import 'package:intl/intl.dart';

import '../../utils.dart';

class CvWidgets extends StatefulWidget {
  const CvWidgets({Key? key}) : super(key: key);

  @override
  State<CvWidgets> createState() => CvWidgetsState();
}

class CvWidgetsState extends State<CvWidgets> {
  CvController controller = CvController();
  Widget nameWidget() {
    return TextFormField(
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, ingresa tus nombres y apellidos';
        }
        return null;
      },
      onChanged: (value) {
        controller.updateValue('name', 1, value);
      },
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Icon(Icons.person),
        ),
        labelText: 'Nombres y Apellidos',
        hintText: 'Juan Perez Cruz',
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget emailWidget() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, ingresa tu correo';
        }
        return null;
      },
      onChanged: (value) {
        controller.updateValue('email', 1, value);
      },
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Icon(Icons.alternate_email),
        ),
        labelText: 'Email',
        hintText: 'email@mail.com',
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget phoneWidget() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, ingresa tu número telefónico';
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          int? phone = int.tryParse(value);
          if (phone != null) {
            controller.updateValue('phone', 0, phone);
          } else {
            // Manejar el caso en que el valor no es un número válido
          }
        }
      },
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Icon(Icons.phone),
        ),
        labelText: 'Número telefónico',
        hintText: '+593 958615588',
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget professionWidget() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, ingresa tu profesión';
        }
        return null;
      },
      onChanged: (value) {
        controller.updateValue('profession', 0, value);
      },
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Icon(Icons.engineering),
        ),
        labelText: 'Profesión',
        hintText: 'Desarrollador de Software',
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget countryWidget() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, ingresa tu país';
        }
        return null;
      },
      onChanged: (value) {
        controller.updateValue('country', 0, value);
      },
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Icon(Icons.south_america),
        ),
        labelText: 'País',
        hintText: 'Ecuador',
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget gitHubWidget() {
    return TextFormField(
      keyboardType: TextInputType.url,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, un link';
        }
        return null;
      },
      onChanged: (value) {
        controller.updateValue('github', 0, value);
      },
      decoration: const InputDecoration(
        prefixIcon: SizedBox(
          width: 55,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 20, right: 10),
                child: FaIcon(FontAwesomeIcons.github)),
          ),
        ),
        labelText: 'github Link',
        hintText: 'https://github.com/User',
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget linkedinWidget() {
    return TextFormField(
      keyboardType: TextInputType.url,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, un link';
        }
        return null;
      },
      onChanged: (value) {
        controller.updateValue('linkedin', 0, value);
      },
      decoration: const InputDecoration(
        prefixIcon: SizedBox(
          width: 55,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 20, right: 10),
                child: FaIcon(FontAwesomeIcons.linkedin)),
          ),
        ),
        labelText: 'Linkedin Link',
        hintText: 'https://linkedin.com/in/user',
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget experiencesWidget() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Experiencia Profesional',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            addButton(() {
              setState(() {
                var item = Experience(
                    company: '',
                    startDate: DateTime.now(),
                    endDate: DateTime.now(),
                    description: '');
                controller.addItem(item);
              });
            }),
            const Spacer(),
            deleteButton(() {
              setState(() {
                controller.removeLastItem('experience');
              });
            }),
          ],
        ),
        Column(
          children: controller.model.experiences.map((experience) {
            final index = controller.model.experiences.indexOf(experience);
            return Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un parámetro';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    controller.updateValue('experienceTitle', index, value);
                  },
                  decoration: const InputDecoration(
                    prefixIcon: SizedBox(
                      width: 55,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 10),
                          child: Icon(Icons.work),
                        ),
                      ),
                    ),
                    labelText: 'Experiencia profesional',
                    hintText: 'Desarrollador Freelance',
                    filled: true,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.timer_sharp),
                          labelText: 'Fecha de inicio',
                          border: InputBorder.none,
                          filled: true,
                        ),
                        readOnly: true,
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: experience.startDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              controller.updateValue(
                                  'experienceStartDate', index, selectedDate);
                            });
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, seleccione una fecha';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          final startDate =
                              DateFormat('dd/MM/yyyy').parse(value);
                          controller.updateValue(
                              'experienceStartDate', index, startDate);
                        },
                        controller: TextEditingController(
                          text: DateFormat('dd/MM/yyyy')
                              .format(experience.startDate),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.timer_sharp),
                          border: InputBorder.none,
                          filled: true,
                          labelText: 'Fecha fin',
                        ),
                        readOnly: true,
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: experience.endDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              controller.updateValue(
                                  'experiencesEndDate', index, selectedDate);
                            });
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, seleccione una fecha';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          final endDate = DateFormat('dd/MM/yyyy').parse(value);
                          controller.updateValue(
                              'experiencesEndDate', index, endDate);
                        },
                        controller: TextEditingController(
                          text: DateFormat('dd/MM/yyyy')
                              .format(experience.endDate),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese una descripción';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    controller.updateValue(
                        'experienceDescription', index, value);
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2,
                      ),
                    ),
                    border: InputBorder.none,
                    labelText: 'Descripción',
                    hintText: 'Breve descripción de la experiencia laboral',
                    filled: true,
                    prefixIcon: const Icon(Icons.text_snippet_outlined),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget educationWidget() {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                const Text(
                  'Educación',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                addButton(() {
                  setState(() {
                    var item = Education(
                        academy: '',
                        startDate: DateTime.now(),
                        endDate: DateTime.now(),
                        description: '');
                    controller.addItem(item);
                  });
                }),
                const Spacer(),
                deleteButton(() {
                  setState(() {
                    controller.removeLastItem('education');
                  });
                }),
              ],
            ),
            for (var index = 0;
                index < controller.model.educations.length;
                index++)
              Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa un parámetro';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.updateValue('educationAcademy', index, value);
                    },
                    decoration: const InputDecoration(
                      prefixIcon: SizedBox(
                        width: 55,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: Icon(Icons.book)),
                        ),
                      ),
                      labelText: 'Educación',
                      hintText: 'Universidad de las Espérides',
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.timer_sharp),
                          labelText: 'Fecha de inicio',
                          border: InputBorder.none,
                          filled: true,
                        ),
                        readOnly: true,
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate:
                                controller.model.educations[index].startDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              controller.updateValue(
                                  'educationStartDate', index, selectedDate);
                            });
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, seleccione una fecha';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          final startDate =
                              DateFormat('dd/MM/yyyy').parse(value);
                          controller.updateValue(
                              'educationStartDate', index, startDate);
                        },
                        controller: TextEditingController(
                            text: DateFormat('dd/MM/yyyy').format(
                                controller.model.educations[index].startDate)),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.timer_sharp),
                          border: InputBorder.none,
                          filled: true,
                          labelText: 'Fecha fin',
                        ),
                        readOnly: true,
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate:
                                controller.model.educations[index].endDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              controller.updateValue(
                                  'educationEndDate', index, selectedDate);
                            });
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, seleccione una fecha';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          final endDate = DateFormat('dd/MM/yyyy').parse(value);
                          controller.updateValue(
                              'educationEndDate', index, endDate);
                        },
                        controller: TextEditingController(
                            text: DateFormat('dd/MM/yyyy').format(
                                controller.model.educations[index].endDate)),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese una descripción';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.updateValue(
                          'educationDescription', index, value);
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 2)),
                        border: InputBorder.none,
                        labelText: 'Título',
                        hintText: 'Ingeniero en sistemas',
                        filled: true,
                        prefixIcon: const Icon(Icons.portrait_rounded)),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
          ],
        ),
      ],
    );
  }

  Widget languagesWidget() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Idioma',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            addButton(() {
              setState(() {
                var item = Language(language: '');
                controller.addItem(item);
              });
            }),
            const Spacer(),
            deleteButton(() {
              setState(() {
                controller.removeLastItem('language');
              });
            })
          ],
        ),
        Column(
          children: [
            for (var index = 0;
                index < controller.model.languages.length;
                index++)
              Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa un idioma';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.updateValue('language', index, value);
                    },
                    decoration: const InputDecoration(
                      prefixIcon: SizedBox(
                        width: 55,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: Icon(Icons.language)),
                        ),
                      ),
                      labelText: 'Idioma',
                      hintText: 'Español Intermedio',
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
          ],
        ),
      ],
    );
  }

  Widget skillWidget() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Skills',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            addButton(() {
              setState(() {
                var item = Skill(skill: '');
                controller.addItem(item);
              });
            }),
            const Spacer(),
            deleteButton(() {
              setState(() {
                controller.removeLastItem('skill');
              });
            })
          ],
        ),
        Column(
          children: [
            for (var index = 0; index < controller.model.skills.length; index++)
              Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa una Skill';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.updateValue('skill', index, value);
                    },
                    decoration: const InputDecoration(
                      prefixIcon: SizedBox(
                        width: 55,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: Icon(
                                  Icons.playlist_add_check_circle_rounded)),
                        ),
                      ),
                      labelText: 'Skill',
                      hintText: 'Flutter',
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
          ],
        ),
      ],
    );
  }

  Widget deleteButton(VoidCallback onPressed) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: onPressed,
    );
  }

  Widget addButton(VoidCallback onPressed) {
    return IconButton(
      icon: const Icon(
        Icons.add_circle_outline_sharp,
        color: Colors.lightBlue,
      ),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Información Personal',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        nameWidget(),
        const SizedBox(height: 15),
        professionWidget(),
        const SizedBox(height: 15),
        emailWidget(),
        const SizedBox(height: 15),
        phoneWidget(),
        const SizedBox(height: 15),
        countryWidget(),
        const SizedBox(height: 15),
        gitHubWidget(),
        const SizedBox(height: 15),
        linkedinWidget(),
        const SizedBox(height: 20),
        experiencesWidget(),
        const SizedBox(height: 20),
        educationWidget(),
        const SizedBox(height: 20),
        languagesWidget(),
        const SizedBox(height: 20),
        skillWidget(),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              controller.savePdf();
            },
            child: const Text('Guardar CV')),
      ],
    );
  }
}
