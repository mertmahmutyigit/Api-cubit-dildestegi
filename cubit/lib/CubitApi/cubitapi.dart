import 'package:cubit/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit.dart';


class CAExample extends StatefulWidget {
  const CAExample({super.key});

  @override
  State<CAExample> createState() => _CAExampleState();
}

class _CAExampleState extends State<CAExample> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CubitApiExample>(context).getDate();
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit API Example'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.setLocale(LocalConstants.trLocale);
            },
            child: Text('TR'),
          ),
          TextButton(
            onPressed: () {
              context.setLocale(LocalConstants.enLocale);
            },
            child: Text('EN'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    LocalConstants.kullaniciAdi,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(LocalConstants.profil),
              onTap: () {
                // Profil sayfasına yönlendirme
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(LocalConstants.ayarlar),
              onTap: () {
                // Ayarlar sayfasına yönlendirme
              },
            ),
            ListTile(
              leading: Icon(Icons.palette),
              title: Text(LocalConstants.temayiDegistir),
              onTap: () {
                // Tema değiştirme işlemi
              },
            ),
            Divider(), // Menüde görsel ayrım oluşturur
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(LocalConstants.cikis),
              onTap: () {
                // Çıkış işlemi
              },
            ),
          ],
        ),
      ),
  
      body: BlocBuilder<CubitApiExample, Mystate>(
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(product.title ?? 'No title'),
                  subtitle: Text(product.description ?? 'No description'),
                  trailing: Text('\$${product.price?.toString() ?? '0'}'),
                  leading: product.thumbnail != null
                      ? Image.network(product.thumbnail!)
                      : null,
                );
              },
            );
          } else if (state is ErrorState) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
