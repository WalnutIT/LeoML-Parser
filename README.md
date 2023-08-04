<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# LeoML Parser

LeoML parser is a software package that provides interface for client applications to work with
LeoML documents. It checks for proper format and validate the LeoML documents.

## Problem description and objectives

### Problem description

Web applications or mobile apps often have long structured texts, such as blog posts or articles.

In this case, it very often makes sense to deliver them to the client only when needed and not right
at the beginning.

Furthermore, such texts are often very complex. They consist of headlines, paragraphs, images,
quotes and much more. To make matters a bit more difficult, each author also has their own stylistic
devices to make a text visual (for example, to highlight certain passages).

HTML or Markdown are well-known markup languages that address this issue. However, both have the
following disadvantage: they do not use the full power of Flutter.
With [flutter_html](https://pub.dev/packages/flutter_html) you can certainly do a lot to adapt a
long structured text to the author's wishes. However, it is not Flutter and it is not a widget that
is used to give the text its appearance. It's HTML and CSS.

The same is true for the [flutter_markdown](https://pub.dev/packages/flutter_markdown) package.

Both packages do not offer the limitless possibilities to visually style a text the way Flutter
does.

### Objectives

The goal is to design a markup language that structures text in a way that it can be easily read by
both humans and machines. This markup language shall be named 'LeoML'.

The individual components of a LeoML document are to be assigned to individually designed widgets by
means of a LeoML parser. This should ensure that every text gets an individual appearance and that
all possibilities of Flutter can be used.

## LeoML

LeoML is a machine-readable language for outlining and formatting text and other data, which is
using the JSON format for structuring the content.

Version 1.0.0 of LeoML knows two types of texts:

1. Blog
2. Article

### General

1. A LeoML document is always an array of objects.
2. The first object of an LeoML document is the type object.
3. Only one level of nested objects is possible.

### Objects

An object can have following attributes:

| Attribute             | Explanation                                                                                                             |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------|
| Tag name              | Name of the corresponding attribute.                                                                                    | 
| Condition             | Indicates, if a tag is mandatory or optional.                                                                           |
| Cardinality           | Indicates, how many elements of the object the LeoML document must contain.                                             | 
| value                 | Predefined value for a specific attribute. Just required for the object "type".                                         |
| Data type             | Data type of the object. Atomic objects can be only from data type "String". Nested data types are from type "complex". |
| Sub tags              | Name of the attributes of the nested object.                                                                            |
| Condition of sub tags | Indicates, if a sub tag is mandatory or optional.                                                                       |
| Sub tag data type     | Data type of the nested object. Attributes of a nested object are always atomic. Therefore, its data type is "String".  |

### Blog template

#### Recommended blog layout

We recommend following layout for your blog post:

![Default blog layout](draw_io/blog_default_layout.png)

A citation can be added after each section or at the end of the text. A section can be also followed
by another section, but we advice to keep your sections to a minimum.

#### Blog objects

##### type

Defines that the current LeoML document is a blog post.

| Tag name | Condition | Cardinality | value | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-------|-----------|----------|-----------------------|-------------------|
| type     | mandatory | 1           | blog  | String    | none     | none                  | none              |

Attention:

1. The "type" tag must be the first tag within a LeoML document.
2. The value must be "blog".

Example

```JSON
[
  {
    "type": "blog"
  }
]
```

##### headline

Main headline of the blog post.

The goal of the headline is to attract attention and encourage the reader to read the opening of the
blog post.

| Tag name | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| headline | mandatory | 1           | String    | none     | none                  | none              |

Attention:

The headline always follows the type object.

Example

```JSON
[
  {
    "headline": "<your headline>"
  }
]
```

##### opening

Short abstract of your article, which does not contains more than 3 or 4 sentences.

The goal of the opening is to attract the reader to read the entire post.

| Tag name | Condition | Cardinality | Data type | Sub tags   | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|------------|-----------------------|-------------------|
| opening  | mandatory | 1           | complex   | text       | mandatory             | String            |
|          |           |             |           | imageURL   | optional              | String            |

It is recommended to use an image for the opening, but there may not always be a need for it.
Therefore this attribute is optional.

Attention:

The opening object always follows the headline object.

Example

```JSON
[
  {
    "opening": {
      "text": "<your text>",
      "imageURL": "<your image url>"
    }
  }
]
```

##### subHeadline

Headline of a section.

The goal of the subHeadline is to attract the reader to read the corresponding section.

| Tag name    | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|-------------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| subHeadline | mandatory | 1-n         | String    | none     | none                  | none              |

Example

```JSON
[
  {
    "subHeadline": "<your sub headline>"
  }
]
```

##### section

Contains the text for a section.

The goal of a section is to provide valuable content for readers.

| Tag name | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| section  | mandatory | 1-n         | String    | none     | none                  | none              |

Example

```JSON
[
  {
    "section": "<your section content>"
  }
]
```

##### list

Contains an bulleted list of at least two elements.

The goal of a bulleted list is to visually break up a text to give the reader a visual break in the
body text as well as to set accents, since lists have a certain attention bonus.

| Tag name | Condition | Cardinality | Data type | Condition of list elements | Cardinality of list elements | List element data type |
|----------|-----------|-------------|-----------|----------------------------|------------------------------|------------------------|
| list     | optional  | 0-n         | list      | mandatory                  | 2-n                          | String                 |

Example

```JSON
[
  {
    "list": [
      "<element 1>",
      "<element 2>",
      "...",
      "<element n>"
    ]
  }
]
```

##### citation

Contains a single citation.

Can be added as evidence of authority.

| Tag name | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| citation | optional  | 0-n         | String    | none     | none                  | none              |

Example

```JSON
[
  {
    "citation": "<citation>"
  }
]
```

##### image

Human are very visual creatures. We can process images very fast, that's why images grab our attention
easily. The benefit of images is therefore, to transmit many information in a very short time in order 
to attract the reader to read your entire article or to continue to read your article. 

| Tag name | Condition   | Cardinality | Data type | Sub tags           | Condition of sub tags | Sub tag data type  |
|----------|-------------|-------------|-----------|--------------------|-----------------------|--------------------|
| image    | optionality | 0-n         | complex   | imageURL           | mandatory             | String             |
|          |             |             |           | imageDescription   | optional              | String             |

Example

```JSON
[
  {
    "image": {
      "imageURL": "<your image url>",
      "imageDescription": "<your image description>"
    }
  }
]
```

#### Example of LeoML blog document

```JSON
[
  {
    "type": "blog"
  },
  {
    "headline": "Why are plants good for home?"
  },
  {
    "opening": {
      "text": "We have known for a long time that plants are good for our well-being, but what exactly do they do? We have listed 10 reasons why you should have plants at home.",
      "imageURL": "<image-url>"
    }
  },
  {
    "subHeadline": "Plants reduce stress"
  },
  {
    "section": "Research has shown that plants in the home help reduce stress. The sight of the color green has a calming effect, so people who are in a green room have lower blood pressure and feel more relaxed and happy."
  },
  {
    "subHeadline": "Plants clear stuffy noses"
  },
  {
    "section": "Plants in the home reduce the risk of colds and nasal congestion by 30%. This is because plants increase humidity and absorb dust particles from the air."
  },
  {
    "subHeadline": "Plants provide clean air in the house"
  },
  {
    "section": "Plants not only bind dust, they also filter pollutants from indoor air. Among other things, they absorb carbon dioxide and convert it into oxygen. The higher humidity also improves the indoor climate in the house. A NASA study shows that plant species such as Epipremnum and Spathiphyllum can purify indoor air."
  },
  {
    "subHeadline": "Plants prevent allergies"
  },
  {
    "section": "Do you have small children? Then you should definitely have plants in the house. Children who grow up in a green environment with lots of plants at a young age have a lower risk of allergies."
  },
  {
    "subHeadline": "Plants against cigarette smoke"
  },
  {
    "section": "Plants filter the toxins contained in cigarette smoke. Is there smoking in your home? Then the spathiphyllum is a good choice."
  },
  {
    "subHeadline": "Plants improve the acoustics in the house"
  },
  {
    "section": "The leaves of plants can absorb background noise, improving indoor acoustics. Are you moving into a new house or have your workplace at home? Then put some plants in your living and working spaces as soundproofing."
  },
  {
    "subHeadline": "Plants provide a restful sleep"
  },
  {
    "section": "Do you have trouble falling asleep or wake up often at night? Air-purifying houseplants create a better indoor climate in your bedroom and generate oxygen. So, in addition to their calming and relaxing properties, plants help you sleep better at night. Choose a location near your bed or hang a LivePicture GO over your bed, for example."
  },
  {
    "subHeadline": "Plants lift the mood"
  },
  {
    "section": "Research shows that plants help fight depression. Plants improve the state of mind, provide positive energy, and make you feel happier."
  },
  {
    "subHeadline": "Plants reduce the risk of headaches"
  },
  {
    "section": "The air-purifying property of plants can counteract headaches. Researchers discovered that plants can filter a number of indoor chemicals such as benzene, trichloroethylene and formaldehyde from indoor air. Formaldehyde, a common cause of headaches, is a gas used in the manufacture of leather or carpet and is found in almost every indoor environment."
  },
  {
    "subHeadline": "Plants increase the ability to concentrate"
  },
  {
    "section": "Clean air, better mood, healthier living environment - to the positive effects of plants is added another, which is especially important if you study or work from home: Plants promote concentration. Research has shown that a natural, green environment helps you refocus after a brief distraction, stay more alert and counteract emerging fatigue. Boost your productivity by placing plants on, behind or above your desk."
  },
  {
    "citation": "https://mobilane.com/de/nachrichten/10-vorteile-von-zimmerpflanzen/#:~:text=Pflanzen%20sorgen%20für%20saubere%20Luft,verbessert%20das%20Raumklima%20im%20Haus. - opened on 07-02-2023 at 20:19 CET"
  }
]
```

### Article template

#### Recommended article layout

We recommend following layout for your article:

![Default blog layout](draw_io/article_default_layout.png)

#### Article objects

##### type

Defines that the current LeoML document is an article.

| Tag name | Condition | Cardinality | value   | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|---------|-----------|----------|-----------------------|-------------------|
| type     | mandatory | 1           | article | String    | none     | none                  | none              |

Attention:

1. The "type" tag must be the first tag within a LeoML document.
2. The value must be "article".

Example

```JSON
[
  {
    "type": "article"
  }
]
```

##### headline

Main headline of the article.

The goal of the headline is to attract attention and encourage the reader to read your article.

| Tag name | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| headline | mandatory | 1           | String    | none     | none                  | none              |

Attention:

The headline always follows the type object.

Example

```JSON
[
  {
    "headline": "<your headline>"
  }
]
```

##### subHeadline

Gives additional content to the headline.

The goal of the subHeadline is to give further information to the reader in order to attract them to
read the entire article.

| Tag name    | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|-------------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| subHeadline | optional  | 0-1         | String    | none     | none                  | none              |

Attention:

1. The subHeadline must follow the headline.
2. The subHeadline should have a more little font size than the headline.

Example

```JSON
[
  {
    "subHeadline": "<your sub headline>"
  }
]
```

##### sectionHeadline

Headline of a section.

The goal of the sectionHeadline is to attract the reader to read the corresponding section.

| Tag name    | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|-------------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| subHeadline | optional  | 0-n         | String    | none     | none                  | none              |

Example

```JSON
[
  {
    "subHeadline": "<your sub headline>"
  }
]
```

##### section

Contains the text for a section.

The goal of a section is to provide valuable content for readers.

| Tag name | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| section  | mandatory | 1-n         | String    | none     | none                  | none              |

Example

```JSON
[
  {
    "section": "<your section content>"
  }
]
```

##### catchLine

Is a very eye-catching excerpt from the actual text to give the reader a brief insight about the
content and make him read the full text.

Example for a catch line: "Veni, vidi, vici" - "I came, I saw, I conquered." wrote Julius Caeser to
the Roman Senate in 47 BC after the battle of Zela was won.

| Tag name  | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|-----------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| catchLine | optional  | 0-n         | String    | none     | none                  | none              |

Example

```JSON
[
  {
    "catchLine": "<your catch line>"
  }
]
```

##### list

Contains an bulleted list of at least two elements.

The goal of a bulleted list is to visually break up a text to give the reader a visual break in the
body text as well as to set accents, since lists have a certain attention bonus.

| Tag name | Condition | Cardinality | Data type | Condition of list elements | Cardinality of list elements | List element data type |
|----------|-----------|-------------|-----------|----------------------------|------------------------------|------------------------|
| list     | optional  | 0-n         | list      | mandatory                  | 2-n                          | String                 |

Example

```JSON
[
  {
    "list": [
      "<element 1>",
      "<element 2>",
      "...",
      "<element n>"
    ]
  }
]
```

##### citation

Contains a single citation.

Can be added as evidence of authority.

| Tag name | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| citation | optional  | 0-n         | String    | none     | none                  | none              |

Example

```JSON
[
  {
    "citation": "<citation>"
  }
]
```

##### image

| Tag name | Condition   | Cardinality | Data type | Sub tags           | Condition of sub tags | Sub tag data type |
|----------|-------------|-------------|-----------|--------------------|-----------------------|-------------------|
| image    | optionality | 0-n         | complex   | imageURL           | mandatory             | String            |
|          |             |             |           | imageDescription   | optional              | String            |

Example

```JSON
[
  {
    "image": {
      "imageURL": "<your image url>",
      "imageDescription": "<your image description>"
    }
  }
]
```

#### Example of LeoML article document

## Features

- Define individual widgets or use default widgets for each object.
- Parsing a LeoML document to a column of widgets.
- Parsing a LeoML document to a set of widgets.

## Usage

### How to create a blog post using the blog template

Hint: Default widgets will be used, if a object is mentioned in the LeoML document and no
corresponding widget was injected.

#### Create a blog instance without custom widget builder injection

```dart

final blog = Blog();
```

#### Create a blog instance with custom widget builder injection

```dart

final headlineBuilder = MyHeadlineBuilder();
final openingBuilder = MyOpeningBuilder();
final subHeadlineBuilder = MySubHeadlineBuilder();
final sectionBuilder = MySectionBuilder();

final blogTemplate = Blog(
  headlineBuilder: headlineBuilder,
  openingBuilder: openingBuilder,
  subHeadlineBuilder: subHeadlineBuilder,
  sectionBuilder: sectionBuilder,);
```

#### Instantiate the LeoML parser

```dart

final leoMLDocumentParser = LeoMLDocumentParser();

```

#### Parse the leoML Document

```dart

const leoMLDocument = '[...]';

// first option: parse the LeoML document to a Column, which includes the widgets
final column = leoMLDocumentParser.parseToColumn(leoMLDocument: leoMLDocument, template: blogTemplate,);

// second option: parse the LeoML document to a Set<Widget>
final set = leoMLDocumentParser.parseToSet(leoMLDocument: leoMLDocument, template: blogTemplate,);
```

#### Complete example

```dart
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';

Column column = const Column();

Future<void> main() async {
  final blogTemplate = Blog(
    headlineBuilder: MyCustomHeadlineBuilder(),
  );
  final leoMLDocumentParser = LeoMLDocumentParser();
  column = await leoMLDocumentParser.parseToColumn(
    leoMLDocument: leoMLDocument,
    template: blogTemplate,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeoML Parser example',
      home: const LeoMLParserExampleApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LeoMLParserExampleApp extends StatelessWidget {
  const LeoMLParserExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: column,
          ),
        ),
      ),
    );
  }
}

class MyCustomHeadlineBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map object}) => MyCustomHeadline(object: object);
}

class MyCustomHeadline extends StatelessWidgetTemplate {
  const MyCustomHeadline({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Text(
    object['headline'],
    style: const TextStyle(
      color: Colors.green,
      fontSize: 44.0,
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  void validateObject() {
    if (object['headline'] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: 'headline',
      );
    }
  }
}

const leoMLDocument = '['
    '{'
    ' "type": "blog"'
    '},'
    '{'
    ' "headline": "Why are plants good for home?"'
    '},'
    '{'
    ' "opening": {'
    '   "text": "We have known for a long time that plants are good for our well-being, but what exactly do they do? We have listed 10 reasons why you should have plants at home.",'
    '   "imageURL": "https://upload.wikimedia.org/wikipedia/commons/a/a1/Houseplants_in_Michigan.jpg"'
    '}'
    '},'
    '{'
    ' "subHeadline": "Plants reduce stress"'
    '},'
    '{'
    ' "section": "Research has shown that plants in the home help reduce stress. The sight of the color green has a calming effect, so people who are in a green room have lower blood pressure and feel more relaxed and happy."'
    '},'
    '{'
    ' "subHeadline": "Plants clear stuffy noses"'
    '},'
    '{'
    ' "section": "Plants in the home reduce the risk of colds and nasal congestion by 30%. This is because plants increase humidity and absorb dust particles from the air."'
    '},'
    '{'
    ' "subHeadline": "Plants provide clean air in the house"'
    '},'
    '{'
    ' "section": "Plants not only bind dust, they also filter pollutants from indoor air. Among other things, they absorb carbon dioxide and convert it into oxygen. The higher humidity also improves the indoor climate in the house. A NASA study shows that plant species such as Epipremnum and Spathiphyllum can purify indoor air."'
    '},'
    '{'
    ' "subHeadline": "Plants prevent allergies"'
    '},'
    '{'
    ' "section": "Do you have small children? Then you should definitely have plants in the house. Children who grow up in a green environment with lots of plants at a young age have a lower risk of allergies."'
    '},'
    '{'
    ' "subHeadline": "Plants against cigarette smoke"'
    '},'
    '{'
    ' "section": "Plants filter the toxins contained in cigarette smoke. Is there smoking in your home? Then the spathiphyllum is a good choice."'
    '},'
    '{'
    ' "subHeadline": "Plants improve the acoustics in the house"'
    '},'
    '{'
    ' "section": "The leaves of plants can absorb background noise, improving indoor acoustics. Are you moving into a new house or have your workplace at home? Then put some plants in your living and working spaces as soundproofing."'
    '},'
    '{'
    ' "subHeadline": "Plants provide a restful sleep"'
    '},'
    '{'
    ' "section": "Do you have trouble falling asleep or wake up often at night? Air-purifying houseplants create a better indoor climate in your bedroom and generate oxygen. So, in addition to their calming and relaxing properties, plants help you sleep better at night. Choose a location near your bed or hang a LivePicture GO over your bed, for example."'
    '},'
    '{'
    ' "subHeadline": "Plants lift the mood"'
    '},'
    '{'
    ' "section": "Research shows that plants help fight depression. Plants improve the state of mind, provide positive energy, and make you feel happier."'
    '},'
    '{'
    ' "subHeadline": "Plants reduce the risk of headaches"'
    '},'
    '{'
    ' "section": "The air-purifying property of plants can counteract headaches. Researchers discovered that plants can filter a number of indoor chemicals such as benzene, trichloroethylene and formaldehyde from indoor air. Formaldehyde, a common cause of headaches, is a gas used in the manufacture of leather or carpet and is found in almost every indoor environment."'
    '},'
    '{'
    ' "subHeadline": "Plants increase the ability to concentrate"'
    '},'
    '{'
    ' "section": "Clean air, better mood, healthier living environment - to the positive effects of plants is added another, which is especially important if you study or work from home: Plants promote concentration. Research has shown that a natural, green environment helps you refocus after a brief distraction, stay more alert and counteract emerging fatigue. Boost your productivity by placing plants on, behind or above your desk."'
    '},'
    '{'
    ' "subHeadline": "Sources"'
    '},'
    '{'
    ' "citation": "https://mobilane.com/de/nachrichten/10-vorteile-von-zimmerpflanzen/#:~:text=Pflanzen%20sorgen%20für%20saubere%20Luft,verbessert%20das%20Raumklima%20im%20Haus. - opened on 07-02-2023 at 20:19 CET"'
    '}'
    ']';
```

## Additional information

### Adding a new template

If the available templates do not meet your requirements you are welcome to create your own template. To create your own template please contact me. You have two options:

1. you can send me a complete documentation (see Blog Template) and I will implement the new template accordingly.
2. you can implement the new template yourself and create a merge request and add me as a reviewer.

If you want to implement your template yourself, the following things have to be fulfilled before it can be published:

1. complete documentation (see Blog Template)
2. the template inherits from ContentTemplate
3. code documentation is complete
4. unit tests have been written 

### Creating an issue

Create an issue in [github](https://github.com/WalnutIT/LeoML-Parser/issues).