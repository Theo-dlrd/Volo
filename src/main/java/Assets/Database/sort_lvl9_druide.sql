INSERT INTO sort (nom_sort,niveau_sort,ecole_sort,duree_incantation,portee,composantes,duree_sort,description,img_sort)
VALUES
    (
        'Changement de forme',
        9,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Transmutation'),
        '1 action',
        'personnelle',
        'V, S, M (un diadème dejade d''une valeur minimale de 1 500 po, que vous devez coiffer avant de lancer le sort)',
        'concentration, jusqu''à 1 heure',
        'Vous prenez la forme d''une créature différente pendant toute la durée du sort. Vous pouvez revêtir l''apparence de n''importe quelle créature dotée d''un indice de dangerosité égal ou inférieur au vôtre. En revanche, vous ne pouvez pas vous changer en une créature artificielle ni en mort-vivant, et vous devez avoir vu au moins une fois la créature que vous imitez. Vous vous changez en un spécimen ordinaire de cette créature, sans niveau de classe et sans le trait incantation.' || E'\n' || 'Vos statistiques de jeu sont remplacées par celles de la créature choisie, mais vous conservez votre alignement et vos valeurs d''intelligence, de Sagesse et de Charisme. Vous gardez également vos compétences et vos maîtrises de jet de sauvegarde, en plus de gagner celles de la créature. Si elle possède les mêmes maîtrises que vous, mais que son bonus est plus élevé, utilisez-le à la place du vôtre. Vous ne pouvez pas utiliser les actions d''antre ni les actions légendaires de la créature.' || E'\n' || 'Vous adoptez les dés de vie et les points de vie de votre nouvelle forme. Quand vous reprenez votre forme normale, vous revenez au nombre de points de vie qui était le vôtre avant de vous transformer. Si vous reprenez votre forme normale parce que vous êtes tombé à 0 point de vie, les dégâts en surplus sont déduits des points de vie de votre forme normale. Tant que ces dégâts ne font pas tomber les points de vie de votre forme normale à 0, vous n''êtes pas inconscient.' || E'\n' || 'Vous conservez les avantages de vos pouvoirs de race, de classe et autre et vous êtes toujours en mesure de les utiliser, à condition que votre nouvelle forme soit physiquement capable de le faire. Vous ne pouvez pas utiliser vos sens spéciaux (comme la vision dans le noir), à moins que votre nouvelle forme n''en soit aussi dotée. Vous pouvez parler uniquement si votre nouvelle forme en est normalement capable.' || E'\n' || 'Quand vous vous transformez, vous choisissez si votre équipement tombe au sol, s''il fusionne avec votre nouvelle forme ou si cette nouvelle forme le porte sur elle, auquel cas il fonctionne normalement. C''est au MD de déterminer si la nouvelle forme peut porter une pièce d''équipement, en fonction de sa taille et de sa morphologie. Votre équipement ne change pas de forme ni de taille pour s''accorder à votre nouvelle forme; si cette dernière ne peut s''en accommoder, l''équipement ou certaines pièces d''équipement tombent à terre ou fusionnent avec votre nouvelle silhouette. L''équipement fusionné ne génère aucun effet.' || E'\n' || 'Pendant la durée du sort, vous pouvez utiliser votre action pour prendre une nouvelle forme répondant aux mêmes critères et aux mêmes règles que précédemment, à une exception : si votre nouvelle forme possède plus de points de vie que la précédente, votre nombre de points de vie reste tel qu''il était.',
        NULL
    ),
    (
        'Tempête vengeresse',
        9,
        (SELECT id_ecole FROM ecole WHERE nom_ecole='Invocation'),
        '1 action',
        'champ de vision',
        'V, S',
        'concentration, jusqu''à 1 minute',
        'Des nuées d''orage menaçantes se forment en un point situé dans votre champ de vision et s''étendent dans un rayon de 108 mètres. Des éclairs strient la zone, le tonnerre gronde et un vent fort se lève. Chaque créature située sous le nuage lors de son apparition (mais pas à plus de 1500 mètres au-dessous) doit faire un jet de sauvegarde de Constitution. Celles qui échouent subissent 2d6 dégâts de tonnerre et sont sourdes pendant 5 minutes.' || E'\n' || 'À chaque round où vous continuez à vous concentrer sur ce sort, il génère des effets supplémentaires à votre tour.' || E'\n' || '**Round 2**: Une pluie acide se met à tomber. Les créatures et les objets situés sous le nuage subissent 1d6 dégâts d''acide.' || E'\n' || '**Round 3**: Vous appelez six éclairs qui s''abattent du nuage sur six créatures ou objets de votre choix situés sous la nuée. Une même créature ou un même objet ne peut pas être la cible de plusieurs éclairs. Une créature frappée par la foudre doit faire un jet de sauvegarde de Dextérité. Si elle échoue, elle subit 10d6 dégâts de foudre, la moitié seulement si elle réussit.' || E'\n' || '**Round4**: La grêle se met à tomber. Chaque créature située sous le nuage subit 2d6 dégâts contondants.' || E'\n' || '**Rounds 5 à 10**: Des bourrasques et une pluie glacée balaient la zone sous le nuage et la transforment en terrain difficile où la visibilité est fortement obstruée. Chaque créature qui s''y trouve subit 1d6 dégâts de froid. Il est impossible d''effectuer une attaque avec une arme à distance dans la zone. Le vent et la pluie fonctionnent comme une distraction sévère quand il s''agit de se concentrer sur un sort. Enfin, des bourrasques de vent fort (de 30 à 75 km/h) dispersent automatiquement le brouillard, la brume et les phénomènes similaires stagnant dans la zone, qu''ils soient d''origine ordinaire ou magique.',
        NULL
    );