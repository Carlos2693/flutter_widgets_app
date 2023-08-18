import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Veniam consequat magna ea dolor. Dolor exercitation tempor labore do occaecat ea occaecat dolor tempor esse exercitation nostrud enim. Est officia occaecat quis duis qui amet dolore irure reprehenderit. Ipsum adipisicing cillum mollit aute.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar')
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar')
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Lorem ipsum anim sint minim exercitation non id dolore eiusmod proident. Pariatur nostrud tempor ullamco amet laborum cillum minim cillum aliqua excepteur adipisicing ullamco. Minim ipsum ipsum nostrud eiusmod do quis id consectetur cupidatat voluptate reprehenderit nisi laboris sunt. Reprehenderit cupidatat veniam veniam dolore mollit reprehenderit irure anim magna mollit voluptate do cupidatat ut. Ad amet mollit dolore magna pariatur excepteur adipisicing nostrud sit laboris excepteur consectetur voluptate. Elit voluptate esse dolore veniam minim proident adipisicing dolore veniam do consequat in occaecat. Mollit quis elit et ea officia cupidatat cupidatat mollit.')
                  ]
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar dialogo'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
