import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // Lógica para voltar à tela anterior
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho
              Center(
                child: Column(
                  children: [
                    // Foto de Perfil
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/profile.jpg'), // Substitua pelo caminho correto
                    ),
                    const SizedBox(height: 8),
                    // Nome do Usuário
                    const Text(
                      'El_mario',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Username
                    const Text(
                      '@El_mario2022',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Data de entrada
                    const Text(
                      'Entrou Março 2022',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Ranking
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.emoji_events, color: Colors.orange),
                  title: const Text('Ranking'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Lógica para abrir a tela de ranking
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Estatísticas
              const Text(
                'Estatísticas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatisticItem(Icons.local_fire_department, '3', 'Dias consecutivos'),
                  _buildStatisticItem(Icons.flash_on, '1432', 'Total XP'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatisticItem(Icons.military_tech, 'Bronze', 'Liga atual'),
                  _buildStatisticItem(Icons.leaderboard, '0', 'Top 3 melhores'),
                ],
              ),
              const SizedBox(height: 24),

              // Amigos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Amigos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Lógica para adicionar amigos
                    },
                    child: const Text(
                      'ADICIONAR AMIGOS',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Lista de Amigos
              _buildFriendItem('Matteus', '4367 XP', Colors.blue),
              _buildFriendItem('Viní', '2334 XP', Colors.red),
              const SizedBox(height: 24),

              // Convidar Amigos
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para convidar amigos
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    'Convide seus amigos',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange, size: 30),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFriendItem(String name, String xp, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Text(
          name[0],
          style: TextStyle(color: color),
        ),
      ),
      title: Text(name),
      subtitle: Text(xp),
      trailing: const Icon(Icons.more_horiz),
      onTap: () {
        // Lógica para interagir com o amigo
      },
    );
  }
}
