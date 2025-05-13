import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/screens/screens.dart'; // Asegúrate que esta importación sea correcta

final appRouter = GoRouter(
  initialLocation: '/home/0', // Opcionalmente podrías cambiar esto a '/' si la redirección lo maneja
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [
        // Sub-ruta para las películas, relativa a /home/:page
        GoRoute(
          path: 'movie/:id', // Correcto: se resolverá como /home/:page/movie/:id
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
        // La ruta problemática fue movida
      ]
    ),

    // Nueva ruta de nivel superior para manejar la redirección desde la raíz '/'
    GoRoute(
      path: '/', // Correcto: es una ruta de nivel superior
      redirect: (_, __) {
        // Redirige de '/' a '/home/0'
        return '/home/0';
      },
    ),

    // Puedes añadir más rutas de nivel superior aquí si es necesario
    // Ejemplo:
    // GoRoute(
    //   path: '/settings',
    //   builder: (context, state) => SettingsScreen(),
    // ),
  ]
);