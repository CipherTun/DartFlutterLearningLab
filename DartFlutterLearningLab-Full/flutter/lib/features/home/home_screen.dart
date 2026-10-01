import 'package:flutter/material.dart';
import '../editor/editor_screen.dart';
import '../exercises/exercise.dart';
import '../projects/projects_screen.dart';
import '../settings/settings_screen.dart';

class HomeScreen extends StatefulWidget { const HomeScreen({super.key}); @override State<HomeScreen> createState() => _HomeScreenState(); }
class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final exercises = const [
    Exercise(title: 'Dart fundamentals', language: 'Dart', description: 'Variables, interpolation and basic types.', code: '''void main() {\n  String name = "Learner";\n  int number = 7;\n  print("Hello, \$name");\n  print("Favorite number: \$number");\n}'''),
    Exercise(title: 'For loops', language: 'Dart', description: 'Practice loop conditions and increments.', code: '''void main() {\n  for (int i = 1; i <= 10; i++) {\n    print(i);\n  }\n}'''),
    Exercise(title: 'First Material screen', language: 'Flutter', description: 'Create a real Material 3 Flutter screen.', code: '''import 'package:flutter/material.dart';\nvoid main() {\n  runApp(MaterialApp(theme: ThemeData(useMaterial3: true), home: Scaffold(appBar: AppBar(title: const Text('Hello Flutter')), body: const Center(child: Text('Your first Flutter screen')))));\n}'''),
  ];
  @override Widget build(BuildContext context) {
    final pages = [_home(context), ProjectsScreen(exercises: exercises), const SettingsScreen()];
    return Scaffold(body: SafeArea(child: pages[index]), bottomNavigationBar: NavigationBar(selectedIndex: index, onDestinationSelected: (v) => setState(() => index = v), destinations: const [NavigationDestination(icon: Icon(Icons.school_outlined), selectedIcon: Icon(Icons.school), label: 'Lab'), NavigationDestination(icon: Icon(Icons.folder_outlined), selectedIcon: Icon(Icons.folder), label: 'Projects'), NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Settings')]));
  }
  Widget _home(BuildContext context) => CustomScrollView(slivers: [SliverAppBar.large(title: const Text('Learning Lab'), actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))]), SliverPadding(padding: const EdgeInsets.fromLTRB(16,0,16,24), sliver: SliverList(delegate: SliverChildListDelegate([Text('Learn by running real code.', style: Theme.of(context).textTheme.headlineSmall), const SizedBox(height: 6), Text('Dart exercises, Flutter UI work, projects, console output and runtime tools in one workspace.', style: Theme.of(context).textTheme.bodyLarge), const SizedBox(height: 20), Text('Dart', style: Theme.of(context).textTheme.titleLarge), const SizedBox(height: 8), ...exercises.where((e) => e.language == 'Dart').map((e) => _card(context,e)), const SizedBox(height: 12), Text('Flutter', style: Theme.of(context).textTheme.titleLarge), const SizedBox(height: 8), ...exercises.where((e) => e.language == 'Flutter').map((e) => _card(context,e))])))]);
  Widget _card(BuildContext context, Exercise e) => Card(margin: const EdgeInsets.only(bottom: 10), child: ListTile(contentPadding: const EdgeInsets.all(16), leading: CircleAvatar(child: Icon(e.language == 'Flutter' ? Icons.phone_android : Icons.code)), title: Text(e.title), subtitle: Padding(padding: const EdgeInsets.only(top: 6), child: Text(e.description)), trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditorScreen(exercise: e)))));
}
