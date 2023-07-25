// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704100636
// 04.07.2023 10:06
const blog1 = '['
    '{'
    '"type": "blog"'
    '},'
    '{'
    '"headline": "Why are plants good for home?"'
    '},'
    '{'
    '"opening": {'
    '"text": "We have known for a long time that plants are good for our well-being, but what exactly do they do? We have listed 10 reasons why you should have plants at home.",'
    '"image_url": "<image-url>"'
    '}'
    '},'
    '{'
    '"subHeadline": "Plants reduce stress"'
    '},'
    '{'
    '"section": "Research has shown that plants in the home help reduce stress. The sight of the color green has a calming effect, so people who are in a green room have lower blood pressure and feel more relaxed and happy."'
    '},'
    '{'
    '"subHeadline": "Plants clear stuffy noses"'
    '},'
    '{'
    '"section": "Plants in the home reduce the risk of colds and nasal congestion by 30%. This is because plants increase humidity and absorb dust particles from the air."'
    '},'
    '{'
    '"subHeadline": "Plants provide clean air in the house"'
    '},'
    '{'
    '"section": "Plants not only bind dust, they also filter pollutants from indoor air. Among other things, they absorb carbon dioxide and convert it into oxygen. The higher humidity also improves the indoor climate in the house. A NASA study shows that plant species such as Epipremnum and Spathiphyllum can purify indoor air."'
    '},'
    '{'
    '"subHeadline": "Plants prevent allergies"'
    '},'
    '{'
    '"section": "Do you have small children? Then you should definitely have plants in the house. Children who grow up in a green environment with lots of plants at a young age have a lower risk of allergies."'
    '},'
    '{'
    '"subHeadline": "Plants against cigarette smoke"'
    '},'
    '{'
    '"section": "Plants filter the toxins contained in cigarette smoke. Is there smoking in your home? Then the spathiphyllum is a good choice."'
    '},'
    '{'
    '"subHeadline": "Plants improve the acoustics in the house"'
    '},'
    '{'
    '"section": "The leaves of plants can absorb background noise, improving indoor acoustics. Are you moving into a new house or have your workplace at home? Then put some plants in your living and working spaces as soundproofing."'
    '},'
    '{'
    '"subHeadline": "Plants provide a restful sleep"'
    '},'
    '{'
    '"section": "Do you have trouble falling asleep or wake up often at night? Air-purifying houseplants create a better indoor climate in your bedroom and generate oxygen. So, in addition to their calming and relaxing properties, plants help you sleep better at night. Choose a location near your bed or hang a LivePicture GO over your bed, for example."'
    '},'
    '{'
    '"subHeadline": "Plants lift the mood"'
    '},'
    '{'
    '"section": "Research shows that plants help fight depression. Plants improve the state of mind, provide positive energy, and make you feel happier."'
    '},'
    '{'
    '"subHeadline": "Plants reduce the risk of headaches"'
    '},'
    '{'
    '"section": "The air-purifying property of plants can counteract headaches. Researchers discovered that plants can filter a number of indoor chemicals such as benzene, trichloroethylene and formaldehyde from indoor air. Formaldehyde, a common cause of headaches, is a gas used in the manufacture of leather or carpet and is found in almost every indoor environment."'
    '},'
    '{'
    '"subHeadline": "Plants increase the ability to concentrate"'
    '},'
    '{'
    '"section": "Clean air, better mood, healthier living environment - to the positive effects of plants is added another, which is especially important if you study or work from home: Plants promote concentration. Research has shown that a natural, green environment helps you refocus after a brief distraction, stay more alert and counteract emerging fatigue. Boost your productivity by placing plants on, behind or above your desk."'
    '},'
    '{'
    '"citation": "https://mobilane.com/de/nachrichten/10-vorteile-von-zimmerpflanzen/#:~:text=Pflanzen%20sorgen%20für%20saubere%20Luft,verbessert%20das%20Raumklima%20im%20Haus. - opened on 07-02-2023 at 20:19 CET"'
    '}'
    ']';

const blog1AsList = [
  {"type": "blog"},
  {"headline": "Why are plants good for home?"},
  {
    "opening": {
      "text":
          "We have known for a long time that plants are good for our well-being, but what exactly do they do? We have listed 10 reasons why you should have plants at home.",
      "image_url": "<image-url>",
    },
  },
  {"subHeadline": "Plants reduce stress"},
  {
    "section":
        "Research has shown that plants in the home help reduce stress. The sight of the color green has a calming effect, so people who are in a green room have lower blood pressure and feel more relaxed and happy.",
  },
  {"subHeadline": "Plants clear stuffy noses"},
  {
    "section":
        "Plants in the home reduce the risk of colds and nasal congestion by 30%. This is because plants increase humidity and absorb dust particles from the air.",
  },
  {"subHeadline": "Plants provide clean air in the house"},
  {
    "section":
        "Plants not only bind dust, they also filter pollutants from indoor air. Among other things, they absorb carbon dioxide and convert it into oxygen. The higher humidity also improves the indoor climate in the house. A NASA study shows that plant species such as Epipremnum and Spathiphyllum can purify indoor air.",
  },
  {"subHeadline": "Plants prevent allergies"},
  {
    "section":
        "Do you have small children? Then you should definitely have plants in the house. Children who grow up in a green environment with lots of plants at a young age have a lower risk of allergies.",
  },
  {"subHeadline": "Plants against cigarette smoke"},
  {
    "section":
        "Plants filter the toxins contained in cigarette smoke. Is there smoking in your home? Then the spathiphyllum is a good choice.",
  },
  {"subHeadline": "Plants improve the acoustics in the house"},
  {
    "section":
        "The leaves of plants can absorb background noise, improving indoor acoustics. Are you moving into a new house or have your workplace at home? Then put some plants in your living and working spaces as soundproofing.",
  },
  {"subHeadline": "Plants provide a restful sleep"},
  {
    "section":
        "Do you have trouble falling asleep or wake up often at night? Air-purifying houseplants create a better indoor climate in your bedroom and generate oxygen. So, in addition to their calming and relaxing properties, plants help you sleep better at night. Choose a location near your bed or hang a LivePicture GO over your bed, for example.",
  },
  {"subHeadline": "Plants lift the mood"},
  {
    "section":
        "Research shows that plants help fight depression. Plants improve the state of mind, provide positive energy, and make you feel happier.",
  },
  {"subHeadline": "Plants reduce the risk of headaches"},
  {
    "section":
        "The air-purifying property of plants can counteract headaches. Researchers discovered that plants can filter a number of indoor chemicals such as benzene, trichloroethylene and formaldehyde from indoor air. Formaldehyde, a common cause of headaches, is a gas used in the manufacture of leather or carpet and is found in almost every indoor environment.",
  },
  {"subHeadline": "Plants increase the ability to concentrate"},
  {
    "section":
        "Clean air, better mood, healthier living environment - to the positive effects of plants is added another, which is especially important if you study or work from home: Plants promote concentration. Research has shown that a natural, green environment helps you refocus after a brief distraction, stay more alert and counteract emerging fatigue. Boost your productivity by placing plants on, behind or above your desk.",
  },
  {
    "citation":
        "https://mobilane.com/de/nachrichten/10-vorteile-von-zimmerpflanzen/#:~:text=Pflanzen%20sorgen%20für%20saubere%20Luft,verbessert%20das%20Raumklima%20im%20Haus. - opened on 07-02-2023 at 20:19 CET",
  },
];
