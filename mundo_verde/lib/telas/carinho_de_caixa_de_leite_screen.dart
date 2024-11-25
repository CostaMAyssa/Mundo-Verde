import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CarinhoDeCaixaDeLeiteScreen extends StatelessWidget {
  final String youtubeLink = "https://www.youtube.com/watch?v=5JUCwjvGGak&list=PLooqzTcqqZvmqNkoxBojvXcqHB9jeJhxV&index=4";

  const CarinhoDeCaixaDeLeiteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carinho de Caixa de Leite"),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Área superior com o vídeo
          GestureDetector(
            onTap: () async {
              if (await canLaunchUrl(Uri.parse(youtubeLink))) {
                await launchUrl(Uri.parse(youtubeLink));
              } else {
                throw 'Could not launch $youtubeLink';
              }
            },
            child: Container(
              color: Colors.black,
              height: 200,
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
          const Divider(),
          // Menu inferior com opções
          Expanded(
            child: ListView(
              children: [
                const ListTile(
                  leading: Icon(Icons.info),
                  title: Text("Passo a Passo"),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.school),
                  title: Text("Materiais Necessários"),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.share),
                  title: Text("Compartilhar este projeto"),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.note),
                  title: Text("Doe este projeto para o bazar solidário Mundo Verde"),
                  onTap: null,
                ),
                const ListTile(
                  leading: Icon(Icons.star_border),
                  title: Text("Adicionar projeto aos favoritos"),
                  onTap: null,
                ),
                const Divider(),
                // Nova área: Espaço Criativo
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Espaço Criativo",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Navegar para a tela de adicionar postagem
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddPostScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Mostre sua Criação"),
                      ),
                      const SizedBox(height: 16),
                      // Exibição de postagens (exemplo de post estático)
                      Column(
                        children: List.generate(3, (index) {
                          return Card(
                            child: ListTile(
                              leading: Icon(Icons.image, size: 50),
                              title: Text("Criação ${index + 1}"),
                              subtitle: Text("Descrição da criação feita por um usuário."),
                              onTap: () {
                                // Exibir detalhes da postagem
                              },
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
        ],
      ),
    );
  }
}

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Criação"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Título da criação",
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: "Descrição",
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Função para salvar a postagem
                Navigator.pop(context);
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
