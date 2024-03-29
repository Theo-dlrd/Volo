INSERT INTO sort (nom_sort,niveau_sort,ecole_sort,duree_incantation,portee,composantes,duree_sort,description,img_sort)
VALUES
(
    'Boule de feu',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Evocation'),
    '1 action',
    '45 mètres',
    'V, S, M (une petite boule de guano de chauve-souris et du soufre)',
    'instantanée',
    'Une traînée luisante part de votre doigt tendu et file vers un point de votre choix situé à portée et dans votre champ de vision, où elle explose dans une gerbe de flammes grondantes. Chaque créature située dans une sphère de 6 mètres de rayon centrée sur ce point doit faire un jet de sauvegarde de Dextérité. Celles qui échouent subissent 8d6 dégâts de feu, les autres la moitié seulement.' || E'\n' || 'Le feu s''étend en contournant les angles. Il embrase les objets inflammables de la zone, à moins que quelqu''un ne les porte ou ne les transporte.' || E'\n' || '**À plus haut niveau**: Si vous lancez ce sort en utilisant un emplacement de niveau 4 ou plus, les dégâts augmentent de 1d6 par niveau au-delà du 3e.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/fireball_spell_bg3_wiki_guide64px.png'
),
(
    'Clairvoyance',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Divination'),
    '10 minutes',
    '1,5 kilomètre',
    'V, S, M (un focaliseur d''une valeur minimale de 100 po, soit une corne incrustée de pierreries pour l''ouïe, soit un oeil de verre pour la vue)',
    'concentration,jusqu''à 10 minutes',
    'Vous créez un organe sensoriel invisible à portée dans un endroit qui vous est familier (un endroit où vous vous êtes déjà rendu ou que vous avez déjà vu) ou dans un endroit évident qui ne vous est pas familier (comme de l''autre côté d''une porte, derrière un coin,dans un bosquet...). L''organe reste là pendant toute la durée du sort. Il est impossible de l''attaquer ou d''interagir avec.' || E'\n' || 'Vous choisissez la vue ou l''ouïe au moment où vous lancez le sort. Vous pouvez alors utiliser le sens choisi à travers l''organe comme si vous occupiez son emplacement. Vous pouvez dépenser une action pour passer de la vue à l''ouïe ou inversement.' || E'\n' || 'Une créature capable de voir l''organe sensoriel (en bénéficiant par exemple de _voir l''invisible_ ou de _vision parfaite_) le perçoit comme un orbe lumineux intangible de la taille de votre poing.',
    NULL
),
(
    'Clignotement',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
    '1 action',
    'personnelle',
    'V, S',
    '1 minute',
    'Pendant toute la durée du sort, vous lancez 1d20 à la fin de chacun de vos tours. Sur un 11 ou plus, vous disparaissez de votre plan d''existence actuel et apparaissez sur le plan éthéré (si vous vous trouviez déjà là, le sort échoue et l''incantation est gaspillée). Au début de votre tour suivant et quand le sort se termine alors que vous vous trouvez sur le plan éthéré, vous retournez sur un emplacement inoccupé de votre choix que vous pouvez voir dans un rayon de 3 mètres autour de l''emplacement dont vous avez disparu. S''il n''y a pas d''emplacement disponible dans ce rayon, vous apparaissez dans l''espace inoccupé le plus proche (choisi au hasard s''il y en a plusieurs à égale distance). Vous pouvez révoquer ce sort par une action.' || E'\n' || 'Tant que vous êtes sur le plan éthéré, vous voyez et entendez ce qui se passe sur le plan d''où vous venez, qui apparaît sous forme d''ombres grises, mais votre vision ne porte pas au-delà de 18 mètres. Vous pouvez seulement affecter des créatures se trouvant sur le plan éthéré et elles sont les seules à pouvoir vous affecter. Les créatures qui ne se trouvent pas sur ce plan ne peuvent ni vous percevoir, ni interagir avec vous, à moins qu''elles ne disposent d''un pouvoir le leur permettant.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/blink-spell-bg3-wiki-guide-64px.png'
),
(
    'Contresort',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Abjuration'),
    '1 réaction à utiliser quand vous voyez une créature située dans un rayon de 18 mètres autour de vous lancer un sort',
    '18 mètres',
    'S',
    'instantanée',
    'Vous tentez d''interrompre une créature en pleine incantation. Si elle essayait de lancer un sort de niveau 3 ou moins, il échoue et reste sans effet. Si le sort est de niveau 4 ou plus, faites un test de caractéristique en utilisant votre caractéristique d''incantation. Le DD est de 10 + niveau du sort. Si vous réussissez, le sort de la créature échoue et reste sans effet.' || E'\n' || 'Au moment de l''incantation, vous pouvez désigner plusieurs créatures de votre choix que le sort ignorera.' || E'\n' || '**À plus haut niveau**: Si vous lancez ce sort en utilisant un emplacement de niveau 4 ou plus, le sort à interrompre est automatiquement sans effet s''il est d''un niveau égal ou inférieur à celui de l''emplacement de sort utilisé.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/counterspell_spells_bg3_wiki_guide64px.png'
),
(
    'Eclair',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Evocation'),
    '1 action',
    'personnelle (ligne de 30 mètres)',
    'V, S, M (un peu de fourrure et une baguette en ambre, en cristal ou en verre)',
    'instantanée',
    'Un éclair formant une ligne de 30 mètres de long pour 1,50 mètre de large jaillit de votre personne et file dans la direction de votre choix. Chaque créature située sur la ligne doit faire un jet de sauvegarde de Dextérité. Celles qui échouent subissent 8d6 dégâts de foudre, les autres la moitié seulement.' || E'\n' || 'La foudre embrase les objets inflammables de la zone qui ne sont ni portés ni transportés par une créature.' || E'\n' || '**À plus haut niveau**: Si vous lancez ce sort en utilisant un emplacement de niveau 4 ou plus, les dégâts augmentent de 1d6 par niveau au-delà du 3e.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/lightningbolt-spell-bg3-wiki-guide-64px.png'
),
(
    'Forme gazeuse',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
    '1 action',
    'contact',
    'V, S, M (un morceau de gaze et une volute de fumée)',
    'concentration, jusqu''à 1 heure',
    'Vous touchez une créature consentante et la transformez, ainsi que tous les objets qu''elle porte et qu''elle transporte, en nuage brumeux pour toute la durée du sort. Ce dernier se termine si la créature tombe à O point de vie. Le sort n''affecte pas les créatures intangibles.' || E'\n' || 'Sous cette forme, la cible n''a plus qu''un seul mode de déplacement : le vol, à une vitesse de 3 mètres. Elle peut entrer dans l''espace d''une autre créature et l''occuper. Elle est résistante aux dégâts non magiques et elle est avantagée lors des jets de sauvegarde de Force, de Dextérité et de Constitution. Elle peut passer à travers de petits trous, de minces ouvertures et même de simples fissures ; en revanche, les liquides équivalent pour elle à des surfaces solides. Elle ne peut pas tomber et continue de flotter dans les airs même si elle est étourdie ou neutralisée.' || E'\n' || 'Sous forme de nuage brumeux, la cible ne peut pas parler ni manipuler d''objet. Il lui est impossible de lâcher les objets qu''elle portait et qu''elle transportait et personne ne peut les utiliser ni interagir avec eux. Elle ne peut pas attaquer ni lancer de sort.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/gaseous_form_spell_bg3_wiki_guide64px.png'
),
(
    'Hâte',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
    '1 action',
    '9 mètres',
    'V, S, M (un copeau de racine de réglisse)',
    'concentration, jusqu''à 1 minute',
    'Choisissez une créature consentante située à portée dans votre champ de vision. Jusqu''à la fin du sort, la cible voit sa vitesse doubler, gagne un bonus de +2 à la CA, est avantagée lors des jets de sauvegarde de Dextérité et dispose d''une action de plus par tour. Cette action est uniquement réservée aux actions suivantes : attaquer (une attaque à l''arme seulement), se précipiter, se désengager, se cacher ou utiliser un objet.' || E'\n' || 'Quand le sort se termine, la cible ne peut pas se déplacer ni effectuer une action avant que son prochain tour ne se soit écoulé, car une vague de léthargie déferle sur elle.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/haste_spells_bg3_wiki_guide64px.png'
),
(
    'Image majeure',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Illusion'),
    '1 action',
    '36 mètres',
    'V, S, M (un morceau de toison)',
    'concentration, jusqu''à 10 minutes',
    'Vous créez l''image d''un objet, d''une créature ou d''un phénomène visible pas plus grand qu''un cube de 6 mètres d''arête. L''image apparaît en un point situé à portée et dans votre champ de vision et persiste pendant toute la durée du sort. Elle a l''air absolument réelle et s''accompagne des sons, des odeurs et de la température appropriés pour la chose qu''elle représente. En revanche, elle ne dégage pas assez de chaleur ou de froid pour blesser quelqu''un, ne génère pas de sons assez puissants pour provoquer des dégâts de tonnerre ou assourdir une créature, et n''émet pas une odeur assez puissante pour écœurer une créature (comme le fait la puanteur du troglodyte).' || E'\n' || 'Tant que vous êtes à portée de l''illusion, vous pouvez utiliser votre action pour déplacer l''image vers un autre point situé à portée. Quand l''image bouge, vous pouvez modifier son apparence de manière à ce que ses mouvements paraissent naturels. Par exemple, si vous créez l''image d''une créature et la déplacez, vous pouvez modifier l''image pour donner l''impression que la créature marche. De même, vous pouvez modifier les sons que l''image émet, à tel point que vous pouvez lui faire tenir une conversation, par exemple.' || E'\n' || 'Les interactions physiques avec l''image révèlent qu''elle n''est qu''une illusion, car les objets la traversent. Si une créature utilise son action pour examiner l''image, elle comprend que c''est une illusion à condition de réussir un test d''Intelligence (Investigation) contre le DD du jet de sauvegarde de votre sort. Si une créature perce l''illusion à jour, elle voit à travers l''image et ne perçoit plus que faiblement ses autres propriétés sensorielles.' || E'\n' || '**À plus haut niveau**: Si vous lancez ce sort en utilisant un emplacement de niveau 6 ou plus, le sort persiste jusqu''à dissipation, sans que vous ayez besoin de vous concentrer.',
    NULL
 ),
(
    'Langues',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Divination'),
    '1 action',
    'contact',
    'V, M (un modèle réduit de ziggourat en argile)',
    '1 heure',
    'Ce sort permet à la créature que vous touchez de comprendre toutes les langues parlées qu''elle entend. De plus, quand elle parle, toute créature qui maîtrise au moins une langue et l''entend comprend ce qu''elle dit.',
    NULL
),
(
    'Lenteur',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
    '1 action',
    '36 mètres',
    'V, S, M (une goutte de mélasse)',
    'concentration, jusqu''à 1 minute',
    'Vous modifiez le cours du temps autour d''un maximum de six créatures de votre choix situées dans un cube de 12 mètres d''arête situé à portée. Chaque cible doit réussir un jet de sauvegarde de Sagesse, sans quoi le sort l''affecte pendant toute sa durée.' || E'\n' || 'Une cible affectée voit sa vitesse réduite de moitié. De plus, elle subit un malus de -2 à la CA et aux jets de sauvegarde de Dextérité et ne peut plus utiliser de réaction. À son tour, elle peut utiliser une action ou une action bonus, mais pas les deux. Elle ne peut pas faire plus d''une attaque au corps à corps ou à distance à son tour, quels que soient ses pouvoirs et ses objets magiques.' || E'\n' || 'Si la créature affectée tente de lancer un sort doté d''un temps d''incantation de 1 action, lancez un d20. Sur un 11 ou plus, le sort agit seulement au prochain tour de la créature qui doit utiliser son action de ce tour pour terminer l''incantation. Si elle est en incapable, le sort est gâché.' || E'\n' || 'Une créature affectée par ce sort fait un nouveau jet de sauvegarde de Sagesse à la fin de son tour. Si elle le réussit, le sort se termine pour elle.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/slow_spell_transmutation_school_baldursgate3_wiki_guide_64px.png'
),
(
    'Marche sur l''eau',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
    '1 action',
    '9 mètres',
    'V, S, M (un bout de liège)',
    '1 heure',
    'Ce sort permet de se déplacer sur n''importe quelle surface liquide (comme de l''eau, de l''acide, de la boue, de la neige, des sables mouvants ou de la lave) comme s''il s''agissait d''un sol ferme et inoffensif (ceci dit, les créatures qui marchent sur la lave subissent tout de même les dégâts liés à la chaleur dégagée). Vous pouvez accorder cette capacité pendant toute la durée du sort à un maximum de dix créatures consentantes situées à portée et dans votre champ de vision.' || E'\n' || 'Si vous prenez pour cible une créature immergée dans un liquide, le sort la ramène à la surface du liquide à une vitesse de 18 mètres par round.',
    NULL
),
(
    'Motif hypnotique',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Illusion'),
    '1 action',
    '36 mètres',
    'S, M (un bâtonnet d''encens incandescent ou une fiole de cristal remplie d''une matière phosphorescente)',
    'concentration, jusqu''à 1 minute',
    'Vous tissez dans les airs un motif aux couleurs mouvantes dans un cube de 9 mètres d''arête situé à portée. Le motif apparaît pendant un bref instant avant de s''évanouir. Chaque créature qui se trouve dans la zone et voit le motif doit faire un jet de sauvegarde de Sagesse. Celles qui échouent sont charmées pendant la durée du sort. Tant qu''une créature est charmée par ce sort, elle est neutralisée et a une vitesse de 0.' || E'\n' || 'Le sort se termine pour une créature donnée si elle subit le moindre dégât ou si quelqu''un d''autre utilise son action pour la secouer et la sortir de sa torpeur.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/hypnotic_pattern_spells_bg3_wiki_guide64px.png'
),
(
    'Nuage puant',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Invocation'),
    '1 action',
    '27 mètres',
    'V, S, M (un œuf pourri ou des feuilles de chou pourri)',
    'concentration,jusqu''à 1 minute',
    'Vous créez une sphère d''un gaz jaunâtre et nauséabond de 6 mètres de rayon centrée sur un point à portée. Le nuage se répand en contournant les angles et la visibilité est nulle dans toute sa zone. Le nuage persiste dans la zone affectée pendant toute la durée du sort.' || E'\n' || 'Chaque créature entièrement englobée dans le nuage au début de son tour doit faire un jet de sauvegarde de Constitution contre le poison. Celles qui échouent passent toute leur action du tour à vomir. Les créatures qui ne respirent pas et celles qui sont immunisées contre le poison réussissent automatiquement ce jet.' || E'\n' || 'Un vent modéré (au moins 15 km/h) disperse le nuage après 4 rounds. Un vent fort (au moins 30 km/h) le disperse au bout de seulement 1 round.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/stinking_cloud_spell_bg3_wiki_guide64px.png'
),
(
    'Peur',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Illusion'),
    '1 action',
    'personnelle (cône de 9 mètres)',
    'V, S, M (une plume blanche ou un cœur de poule)',
    'concentration, jusqu''à 1 minute.',
    'Vous projetez une image fantasmagorique des pires terreurs d''une créature. Chaque créature située dans un cône de 9 mètres doit réussir un jet de sauvegarde de Sagesse ou lâcher tout ce qu''elle tient en main et être terrorisée pendant toute la durée du sort.' || E'\n' || 'Tant qu''une créature est terrorisée par ce sort, elle est obligée d''utiliser l''action se précipiter à chacun de ses tours et de s''éloigner de vous par l''itinéraire le plus sûr, à moins qu''elle n''ait nulle part où aller. Si elle termine son tour en un endroit où vous ne figurez plus dans son champ de vision, elle peut faire un jet de sauvegarde de Sagesse. Si elle le réussit, le sort se termine pour elle.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/fear_spells_bg3_wiki_guide64px.png'
),
(
    'Protection contre l''énergie',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Abjuration'),
    '1 action',
    'contact',
    'V, S',
    'concentration, jusqu''à 1 heure',
    'Pendant toute la durée du sort, la créature consentante que vous touchez devient résistante à un type de dégâts de votre choix : acide, feu, froid, foudre ou tonnerre.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/protection_from_energy_spells_bg3_wiki_guide64px.png'
),
(
    'Respiration aquatique',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
    '1 action',
    '9 mètres',
    'V, S, M (un petit roseau ou un brin de paille)',
    '24 heures',
    'Grâce à ce sort, un maximum de dix créatures situées à portée et dans votre champ de vision deviennent capables de respirer sous l''eau jusqu''à la fin du sort. Les créatures affectées conservent en plus leur mode de respiration normal.',
    NULL
),
(
    'Tempête de neige',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Invocation'),
    '1 action',
    '45 mètres',
    'V, S, M (une pincée de poussière et quelques gouttes d''eau)',
    'concentration, jusqu''à 1 minute',
    'Jusqu''à la fin du sort, une averse de flocons et de neige fondue s''abat dans un cylindre de 6 mètres de haut pour un rayon de 12 mètres centré sur un point de votre choix situé à portée. Dans la zone, la visibilité est fortement obstruée et les flammes à nu s''éteignent.' || E'\n' || 'Le sol de la zone est couvert d''une couche de glace si glissante que le terrain devient difficile. Quand une créature entre dans la zone d''effet pour la première fois de son tour ou y commence son tour, elle doit faire un jet de sauvegarde de Dextérité. Si elle échoue, elle tombe à terre.' || E'\n'|| 'Si une créature se concentre dans la zone d''effet du sort, elle doit faire un jet de sauvegarde de Constitution contre le DD du jet de sauvegarde de votre sort. Si elle échoue, elle perd sa concentration.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/sleet_storm_spells_bg3_wiki_guide64px.png'
),
(
    'Vol',
    3,
    (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
    '1 action',
    'contact',
    'V, S, M (une rémige)',
    'concentration, jusqu''à 10 minutes',
    'Vous touchez une créature consentante et lui conférez la capacité de voler à une vitesse de 18 mètres pendant toute la durée du sort. Si la cible se trouve dans les airs quand le sort se termine, elle tombe, à moins de pouvoir arrêter sa chute.' || E'\n' || '**À plus haut niveau**: Si vous lancez ce sort en utilisant un emplacement de niveau 4 ou plus, vous pouvez viser une créature de plus par niveau au-delà du 3e.',
    'https://baldursgate3.wiki.fextralife.com/file/Baldurs-Gate-3/fly_spell_bg3_wiki_guide64px.png'
);