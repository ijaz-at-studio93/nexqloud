import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart sort_imports.dart <file_or_directory_path>');
    exit(1);
  }

  final target = arguments[0];
  final targetPath = path.absolute(target);

  final projectName = getProjectName();
  if (projectName == null) {
    print('Error: Could not determine the project name from pubspec.yaml.');
    exit(1);
  }

  if (FileSystemEntity.isDirectorySync(targetPath)) {
    processDirectory(targetPath, projectName);
  } else if (FileSystemEntity.isFileSync(targetPath)) {
    processFile(targetPath, projectName);
  } else {
    print('Error: The specified path does not exist or is not accessible.');
    exit(1);
  }
}

String? getProjectName() {
  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    return null;
  }

  final pubspecContent = pubspecFile.readAsStringSync();
  final pubspec = loadYaml(pubspecContent);

  return pubspec['name'] as String?;
}

void processDirectory(String dirPath, String projectName) {
  final dir = Directory(dirPath);
  for (final entity in dir.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      processFile(entity.path, projectName);
    }
  }
}

void processFile(String filePath, String projectName) {
  final file = File(filePath);
  final content = file.readAsStringSync();

  final result = parseString(content: content);
  final unit = result.unit;

  final imports = unit.directives.whereType<ImportDirective>().toList();
  if (imports.isEmpty) {
    print('Sorted imports in: ${path.relative(file.absolute.path)}');
    return;
  }
  final sortedImports = sortImports(imports, projectName);

  final newContent = content.replaceRange(
    unit.directives.first.offset,
    unit.directives.last.end,
    sortedImports,
  );

  file.writeAsStringSync(newContent);
  print('Sorted imports in: ${path.relative(file.absolute.path)}');
}

String sortImports(List<ImportDirective> imports, String projectName) {
  final dartImports = <String>[];
  final flutterImports = <String>[];
  final packageImports = <String>[];
  final projectImports = <String>[];

  for (final import in imports) {
    final uri = import.uri.stringValue;
    if (uri == null) {
      continue;
    }
    if (uri.startsWith('dart:')) {
      dartImports.add(import.toString());
    } else if (uri.startsWith('package:flutter/')) {
      flutterImports.add(import.toString());
    } else if (uri.startsWith('package:$projectName/')) {
      projectImports.add(import.toString());
    } else if (uri.startsWith('package:')) {
      packageImports.add(import.toString());
    } else {
      projectImports.add(import.toString());
    }
  }

  dartImports.sort();
  flutterImports.sort();
  packageImports.sort();
  projectImports.sort();

  return [
    ...dartImports,
    if (dartImports.isNotEmpty) '',
    ...flutterImports,
    if (flutterImports.isNotEmpty) '',
    ...packageImports,
    if (packageImports.isNotEmpty) '',
    ...projectImports,
  ].join('\n');
}
