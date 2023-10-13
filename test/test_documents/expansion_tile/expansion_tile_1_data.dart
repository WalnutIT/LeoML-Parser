// Project: LeoML Parser
// Author: Daniel Krentzlin
// Project begin: 04.07.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20230704100636
// 04.07.2023 10:06
const expansionTile1 =
    '[{"type":"expansion_tile_1"},[{"h1":"Rule 1"},{"h2":"Devices that eiter do not come in direct contact with the patient or contact intact skin only"},{"h3":"General explanation of the rule"},{"tx":"This is a fall-back rule applying to all devices that are not covered by a more specific rule. This is a rule that applies in general to devices that come into contact only with intact skin or that do not come in direct contact with the patient."},{"h4":"Class"},{"tx":"I"},{"tx":"All non-invasive devices are classified as class I, unless one of the rules set out hereinafter applies"},{"h4":"Examples"},{"li":["Devices intended in general for external patient support (e.g. hospital beds, patient hoists, walking aids, wheelchairs, stretchers, dental patient chairs)","Body liquid collection devices intended to be used in such a way that a return flow is unlikely (e.g. to collect body wastes such as urine collection bottles, incontinence pads or collectors used with wound drainage devices). They may be connected to the patient by means of catheters and tubing","Devices used to immobilise body parts and/or to apply force or compression on them (e.g. non-sterile dressings used to aid the healing of a sprain, plaster of Paris, cervical collars, gravity traction devices, compression hosiery)","Corrective spectacle frames (i.e. glasses) and lenses in frames","Stethoscopes","Eye occlusion plasters","Incision drapes ","Non-invasive conductive gels i.e. ultrasound gels","Non-invasive electrodes (electrodes for EEG or ECG)","Permanent magnets for removal of ocular debris","Wheelchairs pushed by hand"]},{"h3":"Practical issues of classification"},{"tx":"Some non-invasive devices are indirectly in contact with the body and can influence internal physiological processes by storing, channelling or treating blood, other body liquids or liquids which are returned or infused into the body or by generating energy that is delivered to the body. These are handled by other rules because of the hazards inherent in such indirect influence on the body."},{"h3":"Note 1"},{"tx":"Intact skin includes the skin around an established stoma unless the skin is breached. Signs of breached skin include, but not limited to, tears, erythema, oedema, weeping and infection. The definition of intact skin must apply for the continuous use of the device."},{"h3":"Note 2"},{"tx":"Ultrasound gels are not to be absorbed or locally dispersed within the body at the site of action in order to achieve their intended purpose."}],[{"h1":"Rule 2"},{"h2":"Channelling or storing for eventual administration"},{"h3":"General explanation of the rule"},{"tx":"This rule applies to non-invasive devices intended for channeling or storing blood, body liquids, cells or tissues, liquids or gases for specific purposes. Invasive devices, other than surgically invasive devices which are intended to administer medicinal products by inhalation, fall under the Rule 20"},{"tx":"These types of devices should be considered separately from the non-contact devices of Rule 1 because they may be indirectly invasive. They channel or store substances that will eventually be administered to the body. Typically these devices are used in transfusion, infusion, extracorporeal circulation and delivery of anaesthetic gases and oxygen."},{"tx":"In some cases devices covered under this rule are very simple delivery devices that rely on gravity."},{"h4":"Class"},{"tx":"IIa"},{"tx":"All non-invasive devices intended for channeling or storing blood, body liquids, cells or tissues, liquids or gases for the purpose of eventual infusion, administration or introduction into the body are classified as class IIa: "},{"tx":"- if they may be connected to a class IIa, class IIb or class III active device; or if they are intended for use for channeling or storing blood or other body liquids or for storing organs, parts of organs or body cells and tissues, "},{"h4":"Examples"},{"li":["Devices intended to be used as channels in active drug delivery systems, e.g. tubing intended for use with an infusion pump","Devices used for channelling gases, e.g. antistatic tubing for anaesthesia, anaesthesia breathing circuits","Syringes for infusion pumps","Devices intended to channel blood (e.g. in transfusion, extracorporeal circulation)","Devices intended for temporary storage and transport of organs for transplantation (i.e. containers, bags)","Devices intended for long term storage of biological substances and tissues such as corneas, sperm, human embryos, etc. (i.e. containers, bags)","Fridges/freezers specifically intended for storing blood, tissues etc.","Tubings/blood lines for extracorporeal treatment (dialysis and apheresis therapies)"]},{"h4":"Class"},{"tx":"IIb"},{"tx":"- except for blood bags; blood bags are classified as class IIb."},{"h4":"Examples"},{"li":["Blood bags without a substance which, if used separately, can be considered to be a medicinal product"]},{"h4":"Class"},{"tx":"I"},{"tx":"- except for blood bags; blood bags are classified as class IIb."},{"h4":"Examples"},{"li":["Non-invasive devices that provide a simple channelling function, with gravity providing the force to transport the liquid, e.g. administration sets for infusion"]},{"h3":"Practical issues of classification"},{"tx":"If a device, e.g. tubing, intended to be used for a purpose that would require it to be connected to an active device, such a device will be automatically in class IIa, unless the manufacturer clearly states that it should not be connected to an active device of class IIa or higher. "},{"h3":"Note 1"},{"tx":" ‘May be connected to an active device’ - such a connection is deemed to exist between a non-active device and an active device where the non-active device forms a link in the transfer of the substance between the patient and the active device and the safety and performance of one of the devices is influenced by the other device. For instance, this applies to tubing in an extracorporeal circulation system which is downstream from a blood pump and in the same blood flow circuit, but not directly connected to the pump. "},{"h3":"Note 2"},{"tx":"See MDCG 2021-24 chapter 3.1.6 Devices with a measuring function regarding the possible measuring function."}]]';

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
