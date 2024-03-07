INSERT INTO sort (nom_sort,alias,nom_sort_en,niveau_sort,ecole_sort,duree_incantation,portee,composantes,duree_sort,description,img_sort)
VALUES
    (
        'Moquerie cruelle',
        NULL,
        'Vicious mockery',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Enchantement'),
        '1 action',
        '18 mètres',
        'V',
        'instantanée',
        'Vous lancez une bordée d''insultes empreintes d''un subtil enchantement à une créature située à portée dans votre champ de vision. Si elle vous entend (elle n''a pas besoin de vous comprendre), elle doit réussir un jet de sauvegarde de Sagesse, sans quoi elle subit 1d4 dégâts psychiques et se trouve désavantagée sur le prochainjet d''attaque qu''elle effectue avant la fin de son prochain tour.' || E'\n' || 'Les dégâts du sort augmentent de 1d4 quand vous atteignez le niveau 5 (2d4), le niveau 11 (3d4) et le niveau 17 (4d4).',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/viciousmockery_spell_bg3_wiki_guide_150px.png'
    ),
    (
        'Assistance',
        NULL,
        'Guidance',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole = 'Divination'),
        '1 action',
        'contact',
        'V, S',
        'concentration, jusqu''à 1 minute',
        'Vous touchez une créature consentante. Une fois avant la fin du sort,la cible peut lancer ld4 et ajouter le chiffre obtenu au test de caractéristique de son choix. Elle peut lancer le dé avant ou après le test. Le sort se termine alors.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/guidance_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Epargner les mourants',
        'Stabilisation',
        'Spare the dying',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole = 'Nécromancie'),
        '1 action',
        'contact',
        'V, S',
        'instantanée',
        'Vous touchez une créature vivante à 0 point de vie, ce qui la stabilise. Ce sort n''a aucun effet sur les morts-vivants et les créatures artificielles.',
        NULL
    ),
    (
        'Flamme sacrée',
        NULL,
        'Sacred flame',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole = 'Evocation'),
        '1 action',
        '18 mètres',
        'V, S',
        'instantanée',
        'Un flamboiement digne d''une flamme s''abat sur une créature située à portée dans votre champ de vision. La cible doit réussir un jet de Dextérité ou subir 1d8 dégâts radiants. Même si elle se trouve derrière un abri, la cible n''est pas avantagée lors dujet de sauvegarde.' || E'\n' || 'Les dégâts du sort augmentent de 1d8 quand vous atteignez le niveau 5 (2d8), le niveau 11 (3d8) et le niveau 17 (4d8).',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/sacred_flame_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Résistance',
        NULL,
        'Resistance',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole = 'Abjuration'),
        '1 action',
        'contact',
        'V, S, M (une cape miniature)',
        'concentration, jusqu''à 1 minute',
        'Vous touchez une créature consentante. Une fois avant la fin du sort, elle peut lancer 1d4 et ajouter le nombre obtenu à un unique jet de sauvegarde de son choix. Elle peut lancer le dé avant ou après avoir fait son jet de sauvegarde. Le sort se termine alors.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/resistance_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Thaumaturgie',
        NULL,
        'Thaumaturgy',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole = 'Transmutation'),
        '1 action',
        '9 mètres',
        'V',
        'jusqu''à 1 minute',
        'Vous créez une manifestation merveilleuse mineure ou un signe de puissance surnaturelle à portée, ce qui génère l''un des effets magiques suivants à portée.' || E'\n' || '* Votre voix retentit jusqu''à trois fois plus fort que la normale pendant 1 minute.' || E'\n' || '* Les flammes vacillent, se ravivent, se réduisent ou changent de couleur pendant une minute.' || E'\n' || '* Vous provoquez des secousses inoffensives qui agitent le sol pendant 1 minute.' || E'\n' || '* Vous émettez un son instantané qui émane d''un point de votre choix situé à portée, comme un roulement de tonnerre, le croassement d''un corbeau ou des murmures inquiétants.' || E'\n' || '* Vous provoquez la fermeture ou l''ouverture violente et immédiate d''une porte ou d''une fenêtre non verrouillée.' || E'\n' || '* Vous modifiez l''apparence de vos yeux pendant 1 minute.' || E'\n' || 'Si vous lancez ce sort à plusieurs reprises, vous ne pouvez avoir que trois effets d''une minute actifs à la fois. Vous pouvez révoquer un tel effet par une action.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/thaumaturgy_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Druidisme',
        NULL,
        'Druidcraft',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
        '1 action',
        '9 mètres',
        'V, S',
        'instantanée',
        'Vous créez l''un des effets suivants à portée après quelques murmures adressés aux esprits de la nature.' || E'\n' || 'Vous créez un effet sensorielm inuscule et inoffensif qui annonce le temps qu''il fera là où vous vous trouvez pendant les 24 heures à venir. Cet effet peut prendre la forme d''un orbe doré si le temps va rester dégagé, d''un nuage s''il va pleuvoir, de flocons s''il va neiger, etc. L''effet persiste pendant 1 round.' || E'\n' || 'Vous faites instantanément éclore une fleur ou un bourgeon ou germer une graine.' || E'\n' || 'Vous créez un effet sensoriel instantané inoffensif, comme des feuilles qui tombent, un coup de vent, le bruit que ferait un petit animal ou une légère odeur de moufette. L''effet doit être contenu dans un cube d''au maximum 1,50 mètre d''arête.' || E'\n' || 'Vous allumez ou éteignez instantanément une chandelle, une torche ou un petit feu de camp.',
        NULL
    ),
    (
        'Fouet épineux',
        NULL,
        'Thorn whip',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
        '1 action',
        '9 mètres',
        'V, S, M (une tige de plante épineuse)',
        'instantanée',
        'Vous créez un long fouet semblable à une liane couverte d''épines. Sur votre ordre, il frappe une créature à portée. Faites une attaque de sort au corps à corps contre la cible. Si vous touchez, la créature subit 1d6 dégâts perforants et, si la créature est de taille Grande ou inférieure, vous l''attirez sur 3 mètres dans votre direction.' || E'\n' || 'Les dégâts du sort augmentent de 1d6 quand vous atteignez le niveau 5 (2d6), le niveau 11 (3d6) et le niveau 17 (4d6).',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/thorn_whip_spell_baldursgate3_wiki_guide_150px.png'
    ),
    (
        'Gourdin magique',
        'Crosse des druides',
        'Shillelagh',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
        '1 action bonus',
        'contact',
        'V, S, M (du gui, une feuille de trèfle et un bâton ou un gourdin)',
        '1 minute',
        'La puissance du monde naturel imprègne le bois du bâton ou du gourdin que vous tenez. Pendant toute la durée du sort, vous pouvèz utiliser votre caractéristique d''incantation au lieu de votre Force pour effectuer les jets d''attaque et de dégâts au corps à corps avec cette arme. Le dé de dégâts de l''arme devient un d8. L''arme devient magique si elle ne l''était pas déjà. Le sort se termine si vous le lancez de nouveau ou si vous lâchez votre arme.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/shillelagh_spell_baldursgate3_wiki_guide_35px.png'
    ),
    (
        'Produire une flamme',
        'Flammes',
        'Produce flame',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Invocation'),
        '1 action',
        'personnelle',
        'V, S',
        '10 minutes',
        'Une flamme vacillante apparaît dans votre main. Elle y reste pendant toute la durée du sort et ne vous blesse pas, pas plus qu''elle n''endommage votre équipement. La flamme émet une vive lumière dans un rayon de 3 mètres et une faible lumière dans un rayon de 3 mètres de plus. Le sort se termine si vous le révoquez par une action ou si vous le lancez de nouveau.' || E'\n' || 'Vous pouvez attaquer avec la flamme, mais cela met fin au sort. Pour cela, quand vous lancez le sort, ou par une action lors d''un tour ultérieur, vous lancez la flamme sur une créature située dans un rayon de 9 mètres. Faites une attaque de sort à distance. Si vous touchez, la cible subit 1d8 dégâts de feu. Les dégâts de ce sort augmentent de 1d8 quand vous atteignez le niveau 5 (2d8), le niveau 11 (3d8) et Je niveau 17 (4d8).',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/produce_flame_spell_baldursgate3_wiki_guide_150px.png'
    ),
    (
        'Amis',
        'Faux amis',
        'Friends',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Enchantement'),
        '1 action',
        'personnelle',
        'V, M (un peu de maquillage à s''appliquer sur le visage lors de l''incantation)',
        'concentration, jusqu''à 1 minute',
        'Pendant toute la durée du sort, vous êtes avantagé sur tous les tests de Charisme à l''encontre d''une créature de votre choix qui ne vous est pas hostile. Quand le sort se termine, cette créature se rend compte que vous avez usé de magie pour l''influencer et elle devient hostile. Si elle est encline à la violence, elle peut très bien vous attaquer. Une autre peut chercher à se venger autrement (au choix du MD), selon la manière dont vous avez interagi avec elle.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/friends_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Aspersion acide',
        'Aspersion d''acide',
        'Acid splash',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Invocation'),
        '1 action',
        '18 mètres',
        'V, S',
        'instantanée',
        'Vous lancez une boule d''acide. Choisissez une créature à portée, ou deux créatures à portée situées à 1,50 mètre ou moins l''une de l''autre. Une cible doit réussir un jet de sauvegarde de Dextérité, sinon elle subit 1d6 dégâts d''acide. Les dégâts du sort augmentent de 1d6 quand vous atteignez le niveau 5 (2d6), le niveau 11 (3d6) et le niveau 17 (4d6).',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/acid_splash_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Bouffée de poison',
        NULL,
        'Poison spray',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Invocation'),
        '1 action',
        '3 mètres',
        'V, S',
        'instantanée',
        'Vous tendez la main en direction d''une créature située à portée dans votre champ de vision et projetez une bouffée de gaz toxique sortie de votre paume. La créature doit réussir un jet de sauvegarde de Constitution ou subir 1d12 dégâts de poison.' || E'\n' || 'Les dégâts du sort augmentent de 1d12 quand vous atteignez le niveau 5 (2d12), le niveau 11 (3d12) et le niveau 17 (4d12).',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/poison_spray_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Contact glacial',
        NULL,
        'Chill touch',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Nécromancie'),
        '1 action',
        '36 mètres',
        'V, S',
        '1 round',
        'Vous faites apparaître une main fantomatique et squelettique à l''emplacement d''une créature située à portée. Faites un jet d''attaque de sort à distance contre la créature pour la transir de froid. Si l''attaque touche, la victime reçoit 1d8 dégâts nécrotiques et ne peut pas récupérer de point de vie avant le début de votre prochain tour. Jusque-là, la main s''accroche à elle.' || E'\n' || 'Si votre cible est un mort-vivant, il est en plus désavantagé lors des jets d''attaque effectués contre vous jusqu''à la fin de votre prochain tour.' || E'\n' || 'Les dégâts du sort augmentent de 1d8 quand vous atteignez le niveau 5 (2d8), le niveau 11 (3d8) et le niveau 17 (4d8).',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/chill_touch_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Illusion mineure',
        NULL,
        'Minor illusion',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Illusion'),
        '1 action',
        '9 mètres',
        'S, M (un morceau de toison)',
        '1 minute',
        'Vous créez à portée un son ou une image représentant un objet. L''illusion persiste pendant toute la durée du sort et se dissipe si vous révoquez le sort par une action ou si vous lancez de nouveau ce sort.' || E'\n' || 'Si vous créez un son, son volume peut aller du simple murmure au hurlement. Ce peut être votre voix, celle de quelqu''un d''autre, le rugissement d''un lion, un battement de tambours ou tout autre son de votre choix. Ce bruit persiste sans faiblir pendant toute la durée du sort, à moins que vous ne préfériez émettre des sons distincts à différents moments pendant la durée du sort.' || E'\n' || 'Si vous créez une image (comme une chaise, des empreintes boueuses ou un petit coffre), elle doit tenir dans un cube de 1,50 mètre d''arête. L''image ne s''accompagne pas de son, de lumière, d''odeur, ni d''autres effets sensoriels. Une interaction physique avec l''image révèle de suite qu''elle n''est qu''une illusion, car les objets la traversent.' || E'\n' || 'Si une créature utilise son action pour examiner le son ou l''image, elle comprend qu''il s''agit d''une illusion si elle réussit un test d''Intelligence (Investigation) opposé au DD du jet de sauvegarde de votre sort. Si une créature perce l''illusion à jour, elle perd toute substance pour elle.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/minor_illusion_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Lumière',
        NULL,
        'Light',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Evocation'),
        '1 action',
        'contact',
        'V, M (une luciole ou de la mousse phosphorescente)',
        '1 heure',
        'Vous touchez un objet qui ne fait pas plus de 3 mètres dans chaque dimension. Jusqu''à la fin du sort, il émet une vive lumière dans un rayon de 6 mètres et une faible lumière dans un rayon de 6 mètres de plus. Vous pouvez colorer cette lumière comme il vous plaît. Il suffit de recouvrir complètement l''objet avec quelque chose d''opaque pour bloquer la lumière. Le sort se termine si vous le lancez de nouveau ou si vous le révoquez en dépensant une action.' || E'\n' || 'Si vous visez un objet porté ou transporté par une créature hostile, cette dernière doit réussir un jet de sauvegarde de Dextérité pour éviter les effets du sort.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/light_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Lumières dansantes',
        NULL,
        'Dancing lights',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Evocation'),
        '1 action',
        '36 mètres',
        'V, S, M (un bout de phosphore ou d''orme, ou un ver luisant)',
        'concentration, jusqu''à 1 minute',
        'Vous créez jusqu''à quatre lumières de la taille d''une torche qui apparaissent à portée. Elles ressemblent à des lanternes, des torches ou des orbes luisants qui flottent dans les airs pendant toute la durée du sort. Vous pouvez aussi les combiner pour obtenir une forme brillante vaguement humanoïde de taille Moyenne. Quelle que soit l''option choisie, chaque source lumineuse offre une faible lumière dans un rayon de 3 mètres.' || E'\n' || 'À votre tour et par une action bonus, vous pouvez déplacer les lumières sur un maximum de 18 mètres pour les installer ailleurs mais toujours à portée. Une lumière créée via ce sort doit toujours se trouver à 6 mètres ou moins d''une autre émanant du même sort. Elle s''éteint si elle passe hors de portée.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/dancing_lights_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Main du mage',
        'Main de mage',
        'Mage hand',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Invocation'),
        '1 action',
        '9 mètres',
        'V, S',
        '1 minute',
        'Une main spectrale flottante apparaît à portée, en un point de votre choix. Elle persiste pendant toute la durée du sort ou jusqu''à ce que vous révoquiez le sort par une action. La main disparaît si elle s''éloigne à plus de 9 mètres de vous ou si vous relancez le sort.' || E'\n' || 'Vous pouvez utiliser votre action pour contrôler la main et vous en servir pour manipuler un objet, ouvrir une porte ou un récipient qui ne sont pas verrouillés, placer un objet dans un récipient ouvert ou l''en sortir ou bien verser le contenu d''une flasque. Vous pouvez déplacer la main d''un maximum de 9 mètres chaque fois que vous l''utilisez.' || E'\n' || 'La main ne peut pas attaquer, activer un objet magique, ni transporter plus de 5 kilos.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/mage_hand_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Message',
        NULL,
        'Message',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
        '1 action',
        '36 mètres',
        'V, S, M (un petit bout de fil de cuivre)',
        '1 round',
        'Vous pointez du doigt une créature à portée et murmurez un message. La cible (et elle seule) l''entend et peut répondre dans un murmure que vous êtes le seul à entendre.' || E'\n' || 'Vous pouvez lancer ce sort au travers d''un objet solide si vous connaissez bien la cible et savez qu''elle se trouve de l''autre côté de cet obstacle. Le sort est bloqué par un silence magique, 30 centimètres de pierre, 2,5 centimètres de métal ordinaire, une mince couche de plomb ou 90 centimètres de bois. Le sort n''a pas besoin de voyager en ligne directe, il peut contourner les angles et franchir les ouvertures.',
        NULL
    ),
    (
        'Poigne électrique',
        NULL,
        'Shocking grasp',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Evocation'),
        '1 action',
        'contact',
        'V, S',
        'instantanée',
        'La foudre jaillit de votre main et bondit sur la créature que vous tentez de toucher. Faites une attaque de sort au corps à corps contre la cible. Vous êtes avantagé lors du jet d''attaque si votre cible porte une armure métallique. Si vous touchez la cible, elle subit 1d8 dégâts de foudre et ne peut pas effectuer de réaction avant le début de son prochain tour.' || E'\n' || 'Les dégâts du sort augmentent de 1d8 quand vous atteignez le niveau 5 (2d8), le niveau 11 (3d8) et le niveau 17 (4d8).',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/shocking_grasp_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Prestidigitation',
        NULL,
        'Prestidigitation',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
        '1 action',
        '3 mètres',
        'V, S',
        'jusqu''à 1 heure',
        'Ce sort est un tour de magie basique que les incantateurs novices utilisent pour s''entraîner. Vous l''utilisez pour créer à portée l''un des effets magiques suivants:' || E'\n' || '* Vous créez un effet sensoriel immédiat et inoffensif, comme une pluie d''étincelles, un coup de vent, de faibles notes de musique ou une odeur étrange.' || E'\n' || '* Vous allumez ou éteignez instantanément une chandelle, une torche ou un petit feu de camp.' || E'\n' || '* Vous nettoyez ou salissez instantanément un objet ne faisant pas plus de 30 décimètres cubes.' || E'\n' || '* Vous refroidissez, réchauffez ou aromatisez jusqu''à 30 décimètres cubes de matière non vivante pendant 1 heure.' || E'\n' || '* Vous faites apparaître une couleur, une petite marque ou un symbole sur un objet ou une surface pendant 1 heure.' || E'\n' || '* Vous créez un colifichet non magique ou une image illusoire tenant dans votre main, qui persiste jusqu''à la fin de votre prochain tour.' || E'\n' || 'Si vous lancez le sort à plusieurs reprises, vous ne pouvez pas avoir plus de trois effets non instantanés actifs à la fois. Vous pouvez révoquer un tel effet par une action.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/otilukes-resilient-sphere-spells-bg3-wiki-guide-min.png'
    ),
    (
        'Protection contre les armes',
        NULL,
        'Blade ward',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Abjuration'),
        '1 action',
        'personnelle',
        'V, S',
        '1 round',
        'Vous tendez la main et tracez un symbole de protection dans les airs. Jusqu''à la fin de votre prochain tour, vous êtes résistant aux dégâts perforants, contondants et tranchants découlant d''une attaque armée.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/blade_ward_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Rayon de givre',
        NULL,
        'Ray of Frost',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Evocation'),
        '1 action',
        '18 mètres',
        'V, S',
        'instantanée',
        'Un rayon de lumière d''un blanc bleuté file vers une créature à portée. Faites une attaque de sort à distance contre la cible. Si vous la touchez, elle subit 1d8 dégâts de froid et sa vitesse est réduite de 3 mètres jusqu''au début de votre prochain tour.' || E'\n' || 'Les dégâts du sort augmentent de 1d8 quand vous atteignez le niveau 5 (2d8), le niveau 11 (3d8) et le niveau 17 (4d8).',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/ray_of_frost_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Réparation',
        NULL,
        'Mending',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
        '1 minute',
        'contact',
        'V, S, M (deux magnétites)',
        'instantanée',
        'Ce sort répare un objet cassé ou déchiré en un seul point, comme un maillon de chaîne cassé, deux moitiés d''une clef brisée, une cape déchirée ou une outre de vin qui fuit. Pour cela, vous devez toucher l''objet et la cassure ou la déchirure ne doit pas mesurer plus de 30 centimètres dans chaque dimension. Le problème se répare et il n''en reste plus trace.' || E'\n' || 'Le sort permet de réparer un objet magique ou une créature artificielle, mais pas de restaurer sa magie.',
        NULL
    ),
    (
        'Trait de feu',
        NULL,
        'Fire bolt',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Evocation'),
        '1 action',
        '36 mètres',
        'V, S',
        'instantanée',
        'Vous lancez un trait enflammé sur une créature ou un objet à portée. Faites une attaque de contact à distance contre la cible. Si vous touchez, elle subit 1dlO dégâts de feu. Si le sort touche un objet inflammable qui n''est ni porté ni transporté, il s''embrase.' || E'\n' || 'Les dégâts du sort augmentent de 1dlO quand vous atteignez le niveau 5 (2d10), le niveau 11 (3d10) et le niveau 17 (4d10).',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/firebolt_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Viser juste',
        'Coup au but',
        'True Strike',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Divination'),
        '1 action',
        '9 mètres',
        'S',
        'concentration, jusqu''à 1 round',
        'Vous tendez la main et pointez du doigt une cible à portée. Votre magie vous donne un bref aperçu de ses défenses. À votre prochain tour, vous êtes avantagé lors de votre premier jet d''attaque contre elle, à condition que le sort ne se soit pas terminé avant.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/true_strike_spell_baldursgate3_wiki_guide_150px_2.png'
    ),
    (
        'Explosion occulte',
        'Décharge occulte',
        'Eldritch blast',
        0,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Evocation'),
        '1 action',
        '36 mètres',
        'V, S',
        'instantanée',
        'Un éclair d''énergie crépitante file vers une créature à portée. Faites un jet d''attaque de sort à distance contre la cible. Si vous réussissez, elle subit 1d10 dégâts de force.' || E'\n' || 'Le sort crée des rayons supplémentaires quand vous atteignez certains niveaux : il lance deux rayons au niveau 5, trois au niveau 11 et quatre au niveau 17. Vous pouvez diriger tous les rayons sur une même cible ou les répartir entre plusieurs. Faites un jet d''attaque distinct pour chaque rayon.',
        'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/eldritch_blast_spell_baldursgate3_wiki_guide_150px_2.png'
    );