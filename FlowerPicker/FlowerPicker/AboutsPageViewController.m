//
//  AboutsPageViewController.m
//  FlowerPicker
//
//  Created by Alvin Lee on 11/19/14.
//  Copyright (c) 2014 CDGL. All rights reserved.
//

// All Flower Information from:
// http://www.teleflora.com/about-flowers/flower-meaning.asp
// http://www.theflowerexpert.com/content/aboutflowers/exoticflowers/calla-lily
// http://livingartsoriginals.com/flower-daisy.htm


#import "AboutsPageViewController.h"

@interface AboutsPageViewController ()

-(void) showOutput: (NSString*)description : (NSString*)name;

@end

@implementation AboutsPageViewController
{
    
    NSArray *flowerDescriptions;
    NSArray *flowerNames;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _Description.text = @"Not only do flowers offer natural beauty and fragrance, they also carry enormous symbolism. Originating in the Victorian period, there was a flower language boom, certain flowers were associated with expressing particular feelings.\n\nClick on a flower for more Info!";
    
    flowerNames = [NSArray arrayWithObjects:
    @"Daisy",
    @"Hydrangea",
    @"Chrysanthemums",
    @"Calla Lily",
    @"Delphinium(Larkspur)",
    @"Iris",
    @"Alstroemeria",
    @"Orchid",
    @"Sunflower",
    @"Rose",
    @"Lily",
    @"Snapdragon(Antirrhinum)",
    nil];
    
    
    flowerDescriptions = [NSArray arrayWithObjects:
                          //Daisy Descrption
    @"The name daisy come from \"day's eye\" because the flower is only open during the day and closes up at night. Another name is \"thunderflower\" since it blooms in the summer when thundershowers are common. In addition, the daisy is believed to keep away lightening. For this reason, it was also kept indoors. A common name in England for the flower is bruisewort since the crushed leaves could be used for soothing bruised or chapped skin. Daisies are believed to be more than 4,000 years old and hairpins decorated with daisies were found during the excavation of the Minoan Palace on the Island of Crete. Even further back, Egyptian ceramics were decorated with daisies.\n\n The flower symbolism associated with the daisy is purity, innocence, loyal love, beauty, patience and simplicity.",
                          //Hydrangeas Description
     @"First discovered in Japan, the name hydrangea comes from the Greek “hydor,” meaning water, and “angos,” meaning jar or vessel.  This roughly translates to “water barrel,” referring to the hydrangea’s need for plenty of water and its cup-shaped flower. With its wooden stems and lacy, star-shaped flowers packed closely together in a pompom, the hydrangea’s color ranges from white to blue to pink and purple, determined by the acidity level of the soil. \n\n There remains some debate over the hydrangea’s symbolism – with some connecting it to vanity and boastfulness (perhaps reflecting its abundance of petals and lavish, rounded shape) and others suggesting that a bouquet of hydrangea expresses the giver’s gratefulness for the recipient’s understanding.  Still others suggest it represents anything that’s sincerely heartfelt. Despite this variation in flower meaning, there appears to be an overwhelming consensus that this 4th wedding anniversary flower possesses enduring grace and beauty.",
                          //Mum Description
     @"With a history that dates back to 15th century B.C., chrysanthemum mythology is filled with a multitude of stories and symbolism. Named from the Greek prefix “chrys-“ meaning golden (its original color) and “-anthemion,” meaning flower, years of artful cultivation have produced a full range of colors, from white to purple to red. Daisy-like with a typically yellow center and a decorative pompon, chrysanthemums symbolize optimism and joy. They’re the November birth flower, the 13th wedding anniversary flower and the official flower of the city of Chicago. In Japan, there’s even a “Festival of Happiness” to celebrate this flower each year. \n\n A symbol of the sun, the Japanese consider the orderly unfolding of the chrysanthemum’s petals to represent perfection, and Confucius once suggested they be used as an object of meditation. It’s said that a single petal of this celebrated flower placed at the bottom of a wine glass will encourage a long and healthy life.",
                          //Calla Description
      @"The Calla lily also known as the pig lily, trumpet lily and arum lily, are not really lilies. Swedish botanist Carolus Linnaeus made a mistake when he was naming the species. The word Calla comes from the Greek term for beautiful. The calla lily is native to Southern Africa, and has a remarkable strength - it can continue to grow in water and even survive frost. Calla lilies are commonly white, but they also come in a variety of colors, including yellow, pink, green, purple, orange and black. The colored varieties are called mini calla lilies, and each carries a different meaning. \n\n While white naturally says purity and innocence, pink has a connotation of admiration and appreciation. Purple, which is often associated with royalty, denotes passion. Yellow ones can carry a multitude of meanings, but are typically associated with gratitude. Black calla lilies, which have a striking and dramatic appearance, carry a certain elegance and mystery. Though they are more of a dark purple or maroon than black, they are still highly sought after by gardeners and flower enthusiasts.",
                          //Delphinium Description
        @"Derived from the Greek word “delphis,” meaning dolphin, delphinium are also commonly known as larkspur. Other names include Lark’s Heel, Lark’s Claw and Knight’s Spur. Used by Native Americans and European settlers to make blue dye, it’s believed that the most ancient use of delphinium flowers was for driving away scorpions. \n\n The July birth flower, these lush, dolphin-shaped flowers symbolize an open heart and ardent attachment and convey a feeling of lightness and levity.",
                          //Iris Description
         @"The iris's mythology dates back to Ancient Greece, when the goddess Iris, who personified the rainbow (the Greek word for iris), acted as the link between heaven and earth. It's said that purple irises were planted over the graves of women to summon the goddess Iris to guide them in their journey to heaven. Irises became linked to the French monarchy during the Middle Ages, eventually being recognized as their national symbol, the fleur-de-lis.\n\n The February birth flower, the 25th wedding anniversary flower and the state flower of Tennessee, the iris's three upright petals are said to symbolize faith, valor and wisdom.",
                          //Alstroemeria Description
         @"Resembling a miniature lily, alstroemeria, often called the Peruvian Lily or Lily of the Incas, was named after its discoverer, Baron Claus von Alstromer, a Swedish baron who collected the seeds on a trip to Spain in 1753. Today, this popular flower can be found in a range of colors – from white to golden yellow, orange to apricot, pink to red, lavender and purple.\n\n Symbolizing friendship and devotion, the alstroemeria’s leaves grow upside down, with the leaf twisting as it grows out from the stem, so that the bottom is facing upwards – much like the twists, turns and growth of our friendships.",
                          //Orchids Description
         @"The most highly coveted of ornamental plants, the delicate, exotic and graceful orchid represents love, luxury, beauty and strength. In ancient Greece, orchids were associated with virility. In fact, Greek women believed that if the father of their unborn child ate large, new orchid tubers, the baby would be a boy. If the mother ate small orchid tubers, she would give birth to a girl.\n\n During the Victorian era, orchid symbolism shifted to luxury, and today this sense of magnificence and artful splendor continues, with orchids representing rare and delicate beauty. The 14th wedding anniversary flower, pink orchids convey pure affection, and the popular cattelya orchid represents mature charm.",
                          //Sunflowers Description
         @"While their distinctive and brilliant appearance makes it easy to see why sunflowers have long held our fascination, when they were first grown in Central and South America, it was more for their usefulness (providing oil and food) than beauty. And perhaps this unique combination of striking beauty and utility is, in part, why sunflowers have appeared as such revered symbols throughout the ages. \n\n It's said that the natives of the Inca Empire worshipped a giant sunflower, and that Incan priestesses wore large sunflower disks made of gold on their garments. Images of sunflowers were found in the temples of the Andes mountains, and Native American Indians placed bowls of sunflower seeds on the graves of their dead. The Impressionist period of art is famous for its fascination with the sunflower, and this striking flower remains today a commonly photographed and painted icon of uncommon beauty. \n\n The 3rd wedding anniversary flower and the state flower of Kansas, sunflowers turn to follow the sun. Their open faces symbolize the sun itself, conveying warmth and happiness, adoration and longevity.",
                          //Rose Description
         @"Long a symbol of love and passion, the ancient Greeks and Romans associated roses with Aphrodite and Venus, goddesses of love. Used for hundreds of years to convey messages without words, they also represent confidentiality. In fact, the Latin expression \"sub rosa\"(literally, \"under the rose\") means something told in secret, and in ancient Rome, a wild rose was placed on the door to a room where confidential matters were being discussed. \n\n Each color offers a distinct meaning: red, the lover's rose, signifies enduring passion; white, humility and innocence; yellow, expressing friendship and joy; pink, gratitude, appreciation and admiration; orange, enthusiasm and desire; white lilac and purple roses represent enchantment and love at first sight.",
                          //Lilies Description
        @"Dating as far back as 1580 B.C., when images of lilies were discovered in a villa in Crete, these majestic flowers have long held a role in ancient mythology. Derived from the Greek word “leiron,” (generally assumed to refer to the white Madonna lily), the lily was so revered by the Greeks that they believed it sprouted from the milk of Hera, the queen of the gods. Lilies are known to be the May birth flower, and the 30th wedding anniversary flower.\n\n While white lilies symbolize chastity and virtue – and were the symbol of the Virgin Mary’s purity and her role of Queen of the Angels – as other varieties became popular, they brought with them additional meanings and symbolism as well. Peruvian lilies, or alstroemeria, represent friendship and devotion, white stargazer lilies express sympathy and pink stargazer lilies represent wealth and prosperity. Symbolizing humility and devotion, lilies of the valley are the 2nd wedding anniversary flower. \n\n As the flowers most often associated with funerals, lilies symbolize that the soul of the departed has received restored innocence after death.",
                          //Snapdragon Description
        @"Derived from the Greek words “anti,” meaning like, and “rhin,” meaning nose, antirrhinum, the snapdragon’s botanical name, is a fitting description of this snout-shaped flower. It’s said that the common name for this colorful flower comes from the snap it makes when the sides of the “dragon’s mouth” are gently squeezed. While their actual origin is unknown, it’s believed that snapdragons were originally wildflowers in Spain and Italy.\n\n Legend has it that concealing a snapdragon makes a person appear fascinating and cordial, and in the language of flowers, snapdragons are said to represent both deception (perhaps tied to the notion of concealment) and graciousness.",
                          
         nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) showOutput:(NSString *)description : (NSString *)name {
    [_Description setFont:[UIFont boldSystemFontOfSize:14]];
    
    _Description.text = description;
    _AboutFlowers.text = name;
    
}


- (IBAction)DaisyButton:(id)sender {
    [self showOutput:flowerDescriptions[0]:flowerNames[0]];
}

- (IBAction)HydrangeasButton:(id)sender {
    [self showOutput:flowerDescriptions[1]:flowerNames[1]];
}

- (IBAction)MumButton:(id)sender {
    [self showOutput:flowerDescriptions[2]:flowerNames[2]];
}

- (IBAction)CallaButton:(id)sender {
    [self showOutput:flowerDescriptions[3]:flowerNames[3]];
}

- (IBAction)DelphiniumsButton:(id)sender {
    [self showOutput:flowerDescriptions[4]:flowerNames[4]];
}

- (IBAction)IrisButton:(id)sender {
    [self showOutput:(flowerDescriptions[5]):flowerNames[5]];
}

- (IBAction)AlstroemeriaButton:(id)sender {
    [self showOutput:flowerDescriptions[6]:flowerNames[6]];
}

- (IBAction)OrchidsButton:(id)sender {
    [self showOutput:flowerDescriptions[7]:flowerNames[7]];
    
}

- (IBAction)SunflowersButton:(id)sender {
    [self showOutput:flowerDescriptions[8]:flowerNames[8]];
}

- (IBAction)RoseButton:(id)sender {
    [self showOutput:flowerDescriptions[9]:flowerNames[9]];
}

- (IBAction)LiliesButton:(id)sender {
    [self showOutput:flowerDescriptions[10]:flowerNames[10]];
}

- (IBAction)SnapdragonsButton:(id)sender {
    [self showOutput:flowerDescriptions[11]:flowerNames[11]];
}


@end
