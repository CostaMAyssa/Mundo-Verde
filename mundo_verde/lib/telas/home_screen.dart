import 'package:flutter/material.dart';
import 'package:mundo_verde/telas/oficina_sustentavel_screen.dart';
// Certifique-se de ajustar o caminho correto

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height; // Altura da tela

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // Fundo claro
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Superior
            Stack(
              children: [
                // Fundo do banner
                Container(
                  height: screenHeight * 0.35, // 35% da altura da tela
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                ),
                // Imagem no fundo
                SizedBox(
                  height: screenHeight * 0.35,
                  width: double.infinity,
                  child: Image.asset(
                    'lib/assets/telaverde.png', // Caminho da imagem
                    fit: BoxFit.cover,
                  ),
                ),
                // Conteúdo do banner
                Positioned(
                  bottom: 16, // Posiciona o conteúdo na parte inferior
                  left: 16, // Distância da lateral esquerda
                  right: 16, // Alinhamento proporcional na lateral direita
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Vamos Criar!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Inicie sua Jornada Criativa Abaixo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Navegação para OficinaSustentavelScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const OficinaSustentavelScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 20,
                          ),
                        ),
                        child: const Text(
                          "Comece por aqui",
                          style: TextStyle(
                            color: Color(0xFF4CAF50),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Filtros de categorias
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildFilterChip("Tudo", selected: true),
                  _buildFilterChip("Doação"),
                  _buildFilterChip("Materiais recicláveis"),
                  _buildFilterChip("Parcerias"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Seção de Atividades
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1200, // Largura máxima do layout
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Criações Sustentáveis em Ação",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Lista de Atividades em Grid
                    GridView.count(
                      crossAxisCount: 1, // Número de colunas
                      crossAxisSpacing: 16, // Espaçamento horizontal
                      mainAxisSpacing: 16, // Espaçamento vertical
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(), // Desativa o scroll do GridView
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      children: [
                        _buildProjectCard(
                          "Finn",
                          "Cadastre sua instituição e lance desafios para engajar nossos usuários na criação de objetos essenciais para atender a nossa comunidade",
                          ["Doação", "Parcerias"],
                          "lib/assets/bghome.png",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Filtros de categorias (Chips)
  Widget _buildFilterChip(String label, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF4CAF50),
            fontWeight: FontWeight.bold,
          ),
        ),
        selected: selected,
        onSelected: (bool value) {
          // Lógica de filtro ao clicar
        },
        backgroundColor: const Color(0xFFECEBFF),
        selectedColor: const Color(0xFF4CAF50),
      ),
    );
  }

  // Cartão de Atividades
  Widget _buildProjectCard(
    String userName,
    String projectTitle,
    List<String> tags,
    String assetPath,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Adapta a altura ao conteúdo
          children: [
            if (assetPath.isNotEmpty) // Exibe a imagem se ela existir
              AspectRatio(
                aspectRatio:
                    16 / 9, // Define a proporção da imagem (largura / altura)
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    assetPath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 8),

            // Título do projeto
            Text(
              projectTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),

            // Tags
            Wrap(
              spacing: 8,
              runSpacing: 0, // Remove o espaço entre linhas
              children: tags
                  .map((tag) => Chip(
                        label: Text(tag),
                        backgroundColor: const Color(0xFFECEBFF),
                        labelStyle: const TextStyle(
                          color: Color(0xFF4CAF50),
                          fontSize: 12,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 8,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
