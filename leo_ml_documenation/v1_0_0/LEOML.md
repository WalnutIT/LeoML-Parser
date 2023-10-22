# LeoML (version 1.1.0)

LeoML is a machine-readable markup language for outlining and formatting text and other data, which
is
using the JSON format for structuring the content. LeoML is using templates in order to structure
the text.

## Table of contents

1. [General](#general)
2. [History of templates](#history-of-templates)
3. [Objects](#objects)
4. [Blog template](#blog-template)
5. [Article template](#article-template)
6. [Expansion Tile 1 template](#expansion-tile-1-template)

## General

1. A LeoML document is always an array of objects.
2. The first object of an LeoML document is the type object, which defines the template.
3. Only one level of nested objects is possible.
4. In general, objects are flexible usable within a template, except the template defines
   restrictions. E. g.: The first object must be always a 'headline' object.

## History of templates

Version 1.0.0:

1. Blog
2. Article

Version 1.1.0:

1. Blog
2. Article
3. Expansion Tile 1

## Objects

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

## Blog template

### Recommended blog layout

We recommend following layout for your blog post:

![Default blog layout](../../draw_io/blog_default_layout.png)

A citation can be added after each section or at the end of the text. A section can be also followed
by another section, but we advice to keep your sections to a minimum.

### Blog objects

#### type

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

#### headline

Main headline of the blog post.

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

#### opening

Short abstract of your article, which does not contains more than 3 or 4 sentences.

| Tag name | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| opening  | mandatory | 1           | complex   | text     | mandatory             | String            |
|          |           |             |           | imageURL | optional              | String            |

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

#### subHeadline

Headline of a section.

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

#### section

Contains the text for a section.

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

#### list

Contains a list of at least two elements.

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

#### citation

Contains a single citation.

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

#### image

| Tag name | Condition   | Cardinality | Data type | Sub tags         | Condition of sub tags | Sub tag data type |
|----------|-------------|-------------|-----------|------------------|-----------------------|-------------------|
| image    | optionality | 0-n         | complex   | imageURL         | mandatory             | String            |
|          |             |             |           | imageDescription | optional              | String            |

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

### Example of LeoML blog document

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

## Article template

### Recommended article layout

We recommend following layout for your article:

![Default blog layout](../../draw_io/article_default_layout.png)

### Article objects

#### type

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

#### headline

Main headline of the article.

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

#### subHeadline

Gives additional content to the headline.

| Tag name    | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|-------------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| subHeadline | optional  | 0-1         | String    | none     | none                  | none              |

Attention:

The subHeadline must follow the headline.

Example

```JSON
[
  {
    "subHeadline": "<your sub headline>"
  }
]
```

#### sectionHeadline

Headline of a section.

| Tag name    | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|-------------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| subHeadline | optional  | 0-n         | String    | none     | none                  | none              |

Example

```JSON
[
  {
    "sectionHeadline": "<your sub headline>"
  }
]
```

#### section

Contains the text for a section.

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

#### catchLine

Is a very eye-catching excerpt from the actual text.

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

#### list

Contains a list of at least two elements.

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

#### citation

Contains a single citation.

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

#### image

| Tag name | Condition   | Cardinality | Data type | Sub tags         | Condition of sub tags | Sub tag data type |
|----------|-------------|-------------|-----------|------------------|-----------------------|-------------------|
| image    | optionality | 0-n         | complex   | imageURL         | mandatory             | String            |
|          |             |             |           | imageDescription | optional              | String            |

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

### Example of LeoML article document

```JSON
[
  {
    "type": "article"
  },
  {
    "headline": "The Rise of Artificial Intelligence"
  },
  {
    "subHeadline": "Pioneering the Future of Technology"
  },
  {
    "section": "Artificial Intelligence (AI) has been a buzzword for several decades, and its applications have seen remarkable progress over the years. From self-driving cars to virtual personal assistants, AI is transforming the way we live and work. In this article, we will explore the fascinating world of artificial intelligence, its history, current advancements, ethical implications, and the potential it holds for the future."
  },
  {
    "sectionHeadline": "The Evolution of Artificial Intelligence"
  },
  {
    "section": "The concept of artificial intelligence dates back to ancient mythology and science fiction tales, where machines or human-like beings possessed intelligence and consciousness. However, it wasn't until the 20th century that the term \"artificial intelligence\" was coined. Early AI research focused on symbolic AI and rule-based systems, but progress was slow due to limitations in computing power."
  },
  {
    "sectionHeadline": "Machine Learning and Neural Networks"
  },
  {
    "section": "A significant breakthrough came with the advent of machine learning and neural networks. Machine learning algorithms enable computers to learn from data and improve their performance over time without explicit programming. Neural networks, inspired by the human brain's structure, revolutionized AI by enabling deep learning, a subfield of machine learning capable of processing vast amounts of complex data."
  },
  {
    "sectionHeadline": "Real-World Applications"
  },
  {
    "section": "AI has already permeated various industries, driving innovations and efficiency. In healthcare, AI is being used for medical image analysis, disease diagnosis, and drug discovery. In finance, AI algorithms optimize trading strategies and risk management. AI-powered chatbots enhance customer support in e-commerce and other sectors. Additionally, AI plays a crucial role in autonomous vehicles, natural language processing, and personalized marketing."
  },
  {
    "sectionHeadline": "Ethical Considerations"
  },
  {
    "section": "As AI becomes more integrated into our lives, ethical concerns have emerged. Issues related to privacy, data security, and bias in AI algorithms have sparked debates about responsible AI development. Ensuring that AI systems are fair, transparent, and accountable is vital to prevent unintended consequences and potential harm."
  },
  {
    "sectionHeadline": "Challenges and Limitations"
  },
  {
    "section": "Despite the rapid progress, AI faces several challenges. One key limitation is \"narrow AI,\" where systems excel at specific tasks but lack general intelligence. Achieving artificial general intelligence (AGI) that mimics human-like intelligence remains an ambitious goal, and researchers must overcome several technical hurdles. Additionally, the rapid growth of AI raises questions about its impact on the job market and the need for reskilling the workforce."
  },
  {
    "sectionHeadline": "The Future of AI"
  },
  {
    "section": "The future of AI holds immense potential. Advancements in quantum computing, robotics, and natural language processing will pave the way for more sophisticated AI applications. As AI becomes an integral part of society, policymakers, researchers, and stakeholders must work together to create robust regulations and frameworks that harness AI's benefits while mitigating risks."
  },
  {
    "sectionHeadline": "Conclusion"
  },
  {
    "section": "Artificial intelligence is an ever-evolving field that continues to shape our world. From streamlining business processes to revolutionizing healthcare and transportation, AI's impact is profound and far-reaching. As we embrace this technology, it is essential to prioritize ethical considerations and ensure that AI aligns with human values. By leveraging the power of AI responsibly, we can navigate the challenges and unlock its full potential for a brighter and more innovative future."
  },
  {
    "sectionHeadline": "Sources"
  },
  {
    "citation": "This text was created automatically by ChatGPT."
  }
]
```

## Expansion tile 1 template

### Example layout

The expansion tile template is a list of sub lists, where each expansion tile represents a sub
list (see example).

![Default blog layout](../../draw_io/science_1_example.png)

### Expansion tile 1 objects

#### type

Defines that the current LeoML document is an Expansion Tile 1.

| Tag name | Condition | Cardinality | value            | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|------------------|-----------|----------|-----------------------|-------------------|
| type     | mandatory | 1           | expansion_tile_1 | String    | none     | none                  | none              |

Attention:

1. The "type" tag must be the first tag within a LeoML document.
2. The value must be "expansion_tile_1".

Example

```JSON
[
  {
    "type": "expansion_tile_1"
  }
]
```

#### header

| Tag name | Condition | Cardinality | Data type | Sub tags    | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|-------------|-----------------------|-------------------|
| header   | mandatory | 1           | complex   | headline    | mandatory             | String            |
|          |           |             |           | subHeadline | optional              | String            |

##### headline

Primary headline of the expansion tile 1 template.

| Tag name | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| headline | mandatory | 1           | String    | none     | none                  | none              |

##### sub headline

Secondary headline of the expansion tile 1 template.

| Tag name    | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|-------------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| subHeadline | optional  | 0-1         | String    | none     | none                  | none              |

Example

```JSON
[
  [
    {
      "header": {
        "headline": "<your headline>",
        "subHeadline": "<your sub headline>"
      }
    },
     {
        "content": {}  
     }
  ]
]
```

#### content

| Tag name | Condition | Cardinality | Data type | Sub tags          | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|-------------------|-----------------------|-------------------|
| content  | mandatory | 1           | complex   | section           | mandatory             | String            |
|          |           |             |           | sectionHeadline   | optional              | String            |
|          |           |             |           | paragraphHeadline | optional              | String            |
|          |           |             |           | list              | optional              | String            |
|          |           |             |           | citation          | optional              | String            |
|          |           |             |           | image             | optional              | String            |

```JSON
[
   [
      {
         "header": {}
      },
      {
         "content": [
            {
               "sectionHeadline": "<your section headline>"
            },
            {
               "section": "<your section>"
            },
            {
               "paragraphHeadline": "<your paragraphHeadline"
            },
            {
               "list": [
                  "<element 1>",
                  "<element 2>",
                  "...",
                  "<element n>"
               ]
            },
            {
               "image": {
                  "imageURL": "<your image url>",
                  "imageDescription": "<your image description>"
               }
            },
            {
               "citation": "<your citation>"
            }
         ]
      }
   ]
]
```

##### section

Contains simple text.

| Tag name | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| section  | mandatory | 1-n         | String    | none     | none                  | none              |

##### section headline

Tertiary section headline of the expansion tile 1 template.

| Tag name        | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|-----------------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| sectionHeadline | optional  | 0-n         | String    | none     | none                  | none              |

#### paragraphHeadline

Quaternary paragraph headline of the expansion tile 1 template.

| Tag name          | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|-------------------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| paragraphHeadline | optional  | 0-n         | String    | none     | none                  | none              |

#### list

Contains a list of at least one elements.

| Tag name | Condition | Cardinality | Data type | Condition of list elements | Cardinality of list elements | List element data type |
|----------|-----------|-------------|-----------|----------------------------|------------------------------|------------------------|
| list     | optional  | 0-n         | list      | mandatory                  | 1-n                          | String                 |

#### citation

Contains a single citation.

| Tag name | Condition | Cardinality | Data type | Sub tags | Condition of sub tags | Sub tag data type |
|----------|-----------|-------------|-----------|----------|-----------------------|-------------------|
| citation | optional  | 0-n         | String    | none     | none                  | none              |

#### image

| Tag name | Condition   | Cardinality | Data type | Sub tags         | Condition of sub tags | Sub tag data type |
|----------|-------------|-------------|-----------|------------------|-----------------------|-------------------|
| image    | optionality | 0-n         | complex   | imageURL         | mandatory             | String            |
|          |             |             |           | imageDescription | optional              | String            |

### Example of LeoML Science 1 document

```JSON
[
   {
      "type": "expansion_tile_1"
   },
   [
      {
         "header": {
            "headline": "Rule 1",
            "subHeadline": "Devices that eiter do not come in direct contact with the patient or contact intact skin only"
         }
      },
      {
         "content": [
            {
               "sectionHeadline": "General explanation of the rule"
            },
            {
               "section": "This is a fall-back rule applying to all devices that are not covered by a more specific rule. This is a rule that applies in general to devices that come into contact only with intact skin or that do not come in direct contact with the patient."
            },
            {
               "paragraphHeadline": "Class"
            },
            {
               "section": "I"
            },
            {
               "section": "All non-invasive devices are classified as class I, unless one of the rules set out hereinafter applies"
            },
            {
               "paragraphHeadline": "Examples"
            },
            {
               "list": [
                  "Devices intended in general for external patient support (e.g. hospital beds, patient hoists, walking aids, wheelchairs, stretchers, dental patient chairs)",
                  "Body liquid collection devices intended to be used in such a way that a return flow is unlikely (e.g. to collect body wastes such as urine collection bottles, incontinence pads or collectors used with wound drainage devices). They may be connected to the patient by means of catheters and tubing",
                  "Devices used to immobilise body parts and/or to apply force or compression on them (e.g. non-sterile dressings used to aid the healing of a sprain, plaster of Paris, cervical collars, gravity traction devices, compression hosiery)",
                  "Corrective spectacle frames (i.e. glasses) and lenses in frames",
                  "Stethoscopes",
                  "Eye occlusion plasters",
                  "Incision drapes ",
                  "Non-invasive conductive gels i.e. ultrasound gels",
                  "Non-invasive electrodes (electrodes for EEG or ECG)",
                  "Permanent magnets for removal of ocular debris",
                  "Wheelchairs pushed by hand"
               ]
            },
            {
               "sectionHeadline": "Practical issues of classification"
            },
            {
               "section": "Some non-invasive devices are indirectly in contact with the body and can influence internal physiological processes by storing, channelling or treating blood, other body liquids or liquids which are returned or infused into the body or by generating energy that is delivered to the body. These are handled by other rules because of the hazards inherent in such indirect influence on the body."
            },
            {
               "paragraphHeadline": "Note 1"
            },
            {
               "paragraph": "Intact skin includes the skin around an established stoma unless the skin is breached. Signs of breached skin include, but not limited to, tears, erythema, oedema, weeping and infection. The definition of intact skin must apply for the continuous use of the device."
            },
            {
               "paragraphHeadline": "Note 2"
            },
            {
               "paragraph": "Ultrasound gels are not to be absorbed or locally dispersed within the body at the site of action in order to achieve their intended purpose."
            }
         ]
      }
   ],
   [
      {
         "header": {
            "headline": "Rule 2",
            "subHeadline": "Channelling or storing for eventual administration"
         }
      },
      {
         "content": [
            {
               "sectionHeadline": "General explanation of the rule"
            },
            {
               "section": "This rule applies to non-invasive devices intended for channeling or storing blood, body liquids, cells or tissues, liquids or gases for specific purposes. Invasive devices, other than surgically invasive devices which are intended to administer medicinal products by inhalation, fall under the Rule 20"
            },
            {
               "section": "These types of devices should be considered separately from the non-contact devices of Rule 1 because they may be indirectly invasive. They channel or store substances that will eventually be administered to the body. Typically these devices are used in transfusion, infusion, extracorporeal circulation and delivery of anaesthetic gases and oxygen."
            },
            {
               "section": "In some cases devices covered under this rule are very simple delivery devices that rely on gravity."
            },
            {
               "paragraphHeadline": "Class"
            },
            {
               "section": "IIa"
            },
            {
               "section": "All non-invasive devices intended for channeling or storing blood, body liquids, cells or tissues, liquids or gases for the purpose of eventual infusion, administration or introduction into the body are classified as class IIa: "
            },
            {
               "section": "- if they may be connected to a class IIa, class IIb or class III active device; or if they are intended for use for channeling or storing blood or other body liquids or for storing organs, parts of organs or body cells and tissues, "
            },
            {
               "paragraphHeadline": "Examples"
            },
            {
               "list": [
                  "Devices intended to be used as channels in active drug delivery systems, e.g. tubing intended for use with an infusion pump",
                  "Devices used for channelling gases, e.g. antistatic tubing for anaesthesia, anaesthesia breathing circuits",
                  "Syringes for infusion pumps",
                  "Devices intended to channel blood (e.g. in transfusion, extracorporeal circulation)",
                  "Devices intended for temporary storage and transport of organs for transplantation (i.e. containers, bags)",
                  "Devices intended for long term storage of biological substances and tissues such as corneas, sperm, human embryos, etc. (i.e. containers, bags)",
                  "Fridges/freezers specifically intended for storing blood, tissues etc.",
                  "Tubings/blood lines for extracorporeal treatment (dialysis and apheresis therapies)"
               ]
            },
            {
               "paragraphHeadline": "Class"
            },
            {
               "section": "IIb"
            },
            {
               "section": "- except for blood bags; blood bags are classified as class IIb."
            },
            {
               "paragraphHeadline": "Examples"
            },
            {
               "list": [
                  "Blood bags without a substance which, if used separately, can be considered to be a medicinal product"
               ]
            },
            {
               "paragraphHeadline": "Class"
            },
            {
               "section": "I"
            },
            {
               "section": "- except for blood bags; blood bags are classified as class IIb."
            },
            {
               "paragraphHeadline": "Examples"
            },
            {
               "list": [
                  "Non-invasive devices that provide a simple channelling function, with gravity providing the force to transport the liquid, e.g. administration sets for infusion"
               ]
            },
            {
               "sectionHeadline": "Practical issues of classification"
            },
            {
               "section": "If a device, e.g. tubing, intended to be used for a purpose that would require it to be connected to an active device, such a device will be automatically in class IIa, unless the manufacturer clearly states that it should not be connected to an active device of class IIa or higher. "
            },
            {
               "paragraphHeadline": "Note 1"
            },
            {
               "paragraph": " ‘May be connected to an active device’ - such a connection is deemed to exist between a non-active device and an active device where the non-active device forms a link in the transfer of the substance between the patient and the active device and the safety and performance of one of the devices is influenced by the other device. For instance, this applies to tubing in an extracorporeal circulation system which is downstream from a blood pump and in the same blood flow circuit, but not directly connected to the pump. "
            },
            {
               "paragraphHeadline": "Note 2"
            },
            {
               "paragraph": "See MDCG 2021-24 chapter 3.1.6 'Devices with a measuring function' regarding the possible measuring function."
            }
         ]
      }
   ]
]
```