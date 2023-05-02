import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectCard extends ConsumerStatefulWidget {
  const ProjectCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectCardState();
}

class _ProjectCardState extends ConsumerState<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[850],
      leading: Text('leading'),
      title: Text('title'),
      subtitle: Text('subtitle'),
      trailing: Text('trailing'),
    );
  }
}
