// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 18.18.2022
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230706153955
// 06.07.2023 15:39
import 'package:flutter/widgets.dart';
import 'package:leoml_parser/src/templates/article/widgets/catch_line.dart';
import 'package:leoml_parser/src/templates/article/widgets/section_headline.dart';
import 'package:leoml_parser/src/templates/blog/widgets/opening.dart';
import 'package:leoml_parser/src/templates/widgets/citation.dart';
import 'package:leoml_parser/src/templates/widgets/headline.dart';
import 'package:leoml_parser/src/templates/widgets/image.dart';
import 'package:leoml_parser/src/templates/widgets/list.dart';
import 'package:leoml_parser/src/templates/widgets/section.dart';
import 'package:leoml_parser/src/templates/widgets/sub_headline.dart';

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

/// A widget builder for building Headline widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Headline] widget based on the provided
/// `object` data.
class HeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) =>
      Headline(object: object)..validateObject();
}

/// A widget builder for building SubHeadline widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [SubHeadline] widget based on the provided
/// `object` data.
class SubHeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) =>
      SubHeadline(object: object)..validateObject();
}

/// A widget builder for building SectionHeadline widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [SectionHeadline] widget based on the provided
/// `object` data.
class SectionHeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) =>
      SectionHeadline(object: object)..validateObject();
}

/// A widget builder for building Section widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Section] widget based on the provided
/// `object` data.
class SectionBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) =>
      Section(object: object)..validateObject();
}

/// A widget builder for building Citation widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Citation] widget based on the provided
/// `object` data.
class CitationBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) =>
      Citation(object: object)..validateObject();
}

/// A widget builder for building Image widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Image] widget based on the provided
/// `object` data.
class ImageBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) =>
      LeoImage(object: object)..validateObject();
}

/// A widget builder for building List widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [List] widget based on the provided
/// `object` data.
class ListBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) =>
      BulletList(object: object)..validateObject();
}

/// A widget builder for building CatchLine widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [CatchLine] widget based on the provided
/// `object` data.
class CatchLineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) =>
      CatchLine(object: object)..validateObject();
}

/// A widget builder for building Opening widgets.
///
/// This class extends the [LeoMLWidgetBuilder] class and overrides its `build`
/// method.
/// It is responsible for building a [Opening] widget based on the provided
/// `object` data.
class OpeningBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) =>
      Opening(object: object)..validateObject();
}

