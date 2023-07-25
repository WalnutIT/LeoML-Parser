// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230706093819
// 06.07.2023 09:38
import 'package:flutter/widgets.dart';

/// An abstract base class for stateless widget templates.
///
/// This class extends [StatelessWidget] and serves as a template for creating stateless widget classes.
/// It provides a `validateObject` method that can be implemented by subclasses for validating the object data.
abstract class StatelessWidgetTemplate extends StatelessWidget {
  /// Creates a new instance of the [StatelessWidgetTemplate].
  ///
  /// The [object] parameter is the object data used by the template.
  const StatelessWidgetTemplate({
    Key? key,
    required this.object,
  }) : super(key: key);

  /// The object data used by the template.
  final Map object;

  /// Validates the object data.
  ///
  /// Subclasses should implement this method to perform custom validation logic on the object data.
  void validateObject();
}

