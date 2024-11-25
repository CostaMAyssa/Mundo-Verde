import 'package:flutter/material.dart';
import 'perfil_screen.dart';
import 'carinho_de_caixa_de_leite_screen.dart';
class OficinaSustentavelScreen extends StatelessWidget {
  const OficinaSustentavelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior (HomeScreen)
          },
        ),
        title: const Text(
          'Oficina Sustentável',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.emoji_events,
                  color: Colors.amber,
                ),
                const SizedBox(width: 4),
                const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16), // Espaçamento entre os ícones
                IconButton(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PerfilScreen(),
                      ),
                    ); // Navega para a tela PerfilScreen
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Card centralizado com tamanho padrão
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Container(
                    width: 300, // Largura padrão do Card
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white, // Fundo branco
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // Conteúdo centralizado
                      mainAxisSize: MainAxisSize.min, // Altura ajustada ao conteúdo
                      children: [
                        Image.asset(
                          'lib/assets/logo.png', // Substitua pelo caminho correto da imagem
                          height: 80,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Fase 1',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '1/40',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Categorias
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _buildCategoryItem(
                          context,
                          'lib/assets/carinhodeleite.png',
                          'Carinho de Caixa de Leite',
                          Colors.green,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: _buildCategoryItem(
                          context,
                          'assets/book.png',
                          'Porta Lápis',
                          Colors.blue,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _buildLockedCategoryItem(
                          context,
                          'assets/locked.png',
                          'Bloqueado',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: _buildCategoryItem(
                          context,
                          'assets/animals.png',
                          'Animais',
                          Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget para uma categoria desbloqueada
  Widget _buildCategoryItem(BuildContext context, String asset, String title, Color color) {
    return GestureDetector(
      onTap: () {
        if (title == 'Carinho de Caixa de Leite') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CarinhoDeCaixaDeLeiteScreen(),

            ),
          );
        }
      },
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                asset,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Widget para uma categoria bloqueada
  Widget _buildLockedCategoryItem(BuildContext context, String asset, String title) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              asset,
              height: 40,
              fit: BoxFit.contain,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
