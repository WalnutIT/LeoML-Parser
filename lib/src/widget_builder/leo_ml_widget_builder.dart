// Project: Weather Poser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230804094208
// 04.08.2023 09:42
import 'package:flutter/widgets.dart';

/// Short briefing about the [default_widgets_builder.dart] file:
///
/// The builder pattern is a creational design pattern that allows the
/// construction of complex objects step by step, separating the construction
/// logic from the representation.
///
/// In this code:
///
/// LeoMLWidgetBuilder is an abstract class that acts as the builder interface,
/// defining the build method, which all concrete builders must implement.
/// It serves as a contract for building different widgets based on the provided
/// object.
///
/// Each concrete class like HeadlineBuilder, SubHeadlineBuilder, etc., extends
/// LeoMLWidgetBuilder and overrides the build method. Each of these concrete
/// builders is responsible for building a specific type of widget
/// (e.g., Headline, SubHeadline, etc.) based on the provided object data.
///
/// The build method in each concrete builder creates the corresponding widget
/// (e.g., Headline, SubHeadline, etc.) using the provided object data and
/// returns the built widget.
///
/// This pattern allows the code to create and return specific widgets
/// (e.g., Headline, SubHeadline, etc.) using the same builder interface
/// (LeoMLWidgetBuilder). It promotes the principle of single responsibility,
/// making each builder responsible for building a specific type of widget,
/// and it also allows for easy extensibility by adding new widget builders
/// without modifying existing code.

/// A default widget builder based on the provided object.
///
/// The [object] parameter is a LeoML object containing the necessary data to
/// build the widget.
///
/// Returns the built widget.
abstract class LeoMLWidgetBuilder {
  Widget build({required Map object});
}
