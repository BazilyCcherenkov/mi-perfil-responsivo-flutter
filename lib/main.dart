import 'package:flutter/material.dart';

void main() => runApp(const MiPerfilResponsivo());

class MiPerfilResponsivo extends StatelessWidget {
  const MiPerfilResponsivo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Perfil Responsivo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const PerfilHome(),
    );
  }
}

class PerfilHome extends StatelessWidget {
  const PerfilHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Detectamos ancho del dispositivo
    final double width = MediaQuery.of(context).size.width;
    final bool isTablet = width >= 600; // breakpoint entre teléfono y tablet

    return Scaffold(
      appBar: AppBar(
        title: Text(isTablet ? 'Mi Perfil - Vista Tblet' : 'Mi Perfil'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 24 : 12),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return isTablet
                  ? _buildTabletLayout(context)
                  : _buildPhoneLayout(context);
            },
          ),
        ),
      ),
    );
  }

  /// Diseño para pantallas de teléfono (vertical)
  Widget _buildPhoneLayout(BuildContext context) {
    return Column(
      children: [
        _EncabezadoSection(isTablet: false),
        const SizedBox(height: 12),
        _InformacionPersonalSection(isTablet: false),
        const SizedBox(height: 12),
        _HabilidadesSection(isTablet: false),
      ],
    );
  }

  /// Diseño para pantallas de tablet (horizontal)
  Widget _buildTabletLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              _EncabezadoSection(isTablet: true),
              const SizedBox(height: 20),
              _InformacionPersonalSection(isTablet: true),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: _HabilidadesSection(isTablet: true),
        ),
      ],
    );
  }
}

/// Sección de Encabezado con foto de perfil, nombre y profesión
class _EncabezadoSection extends StatelessWidget {
  final bool isTablet;
  const _EncabezadoSection({required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 24 : 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            isTablet ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          // Foto de perfil obiamente una random , por privasidad :(
          CircleAvatar(
            radius: isTablet ? 60 : 50,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: isTablet ? 57 : 47,
              backgroundImage: const NetworkImage(
                'https://previews.123rf.com/images/metelsky/metelsky1809/metelsky180900233/109815470-man-avatar-profile-male-face-icon-vector-illustration.jpg',
              ),
            ),
          ),
          SizedBox(height: isTablet ? 16 : 12),
          // Nombre
          Text(
            'Franklin Melendres Caceres',
            style: TextStyle(
              fontSize: isTablet ? 24 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: isTablet ? TextAlign.left : TextAlign.center,
          ),
          SizedBox(height: isTablet ? 8 : 6),
          // Profesión
          Text(
            'Resolucion de la guia 3 INF-662',
            style: TextStyle(
              fontSize: isTablet ? 18 : 16,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
            textAlign: isTablet ? TextAlign.left : TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Sección de Información Personal
class _InformacionPersonalSection extends StatelessWidget {
  final bool isTablet;
  const _InformacionPersonalSection({required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> informacion = [
      {'icon': Icons.cake, 'label': 'Edad', 'value': '22 años'},
      {
        'icon': Icons.email,
        'label': 'Correo',
        'value': 'franklinmeendres734@gmail.com'
      },
      {
        'icon': Icons.location_on,
        'label': 'Ubicación',
        'value': 'Potosí, Bolivia'
      },
      {'icon': Icons.phone, 'label': 'Teléfono', 'value': '+591 73323042'},
    ];

    return Container(
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informacion Personal',
            style: TextStyle(
              fontSize: isTablet ? 20 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple.shade700,
            ),
          ),
          SizedBox(height: isTablet ? 16 : 12),
          ...informacion.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Icon(
                      item['icon'],
                      color: Colors.deepPurple,
                      size: isTablet ? 24 : 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['label'],
                            style: TextStyle(
                              fontSize: isTablet ? 14 : 12,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item['value'],
                            style: TextStyle(
                              fontSize: isTablet ? 16 : 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

/// Sección de Habilidades con tarjetas adaptables
class _HabilidadesSection extends StatelessWidget {
  final bool isTablet;
  const _HabilidadesSection({required this.isTablet});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> habilidades = [
      {'nombre': 'Flutter', 'icon': Icons.phone_android, 'color': Colors.blue},
      {'nombre': 'Dart', 'icon': Icons.code, 'color': Colors.teal},
      {'nombre': 'Firebase', 'icon': Icons.cloud, 'color': Colors.orange},
      {'nombre': 'Git', 'icon': Icons.source, 'color': Colors.red},
      {
        'nombre': 'UI/UX Design',
        'icon': Icons.design_services,
        'color': Colors.purple
      },
      {'nombre': 'API REST', 'icon': Icons.api, 'color': Colors.green},
    ];

    final crossCount = isTablet ? 3 : 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: isTablet ? 8 : 4,
            bottom: isTablet ? 16 : 12,
          ),
          child: Text(
            'Habilidades e Intereses',
            style: TextStyle(
              fontSize: isTablet ? 22 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple.shade700,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: isTablet ? 1.2 : 1.1,
          ),
          itemCount: habilidades.length,
          itemBuilder: (context, index) {
            final habilidad = habilidades[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      habilidad['color'].withOpacity(0.7),
                      habilidad['color'].withOpacity(0.9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      habilidad['icon'],
                      size: isTablet ? 48 : 40,
                      color: Colors.white,
                    ),
                    SizedBox(height: isTablet ? 12 : 8),
                    Text(
                      habilidad['nombre'],
                      style: TextStyle(
                        fontSize: isTablet ? 18 : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
