import 'package:epi_space/ImageDayRoute/ImageDayRoute.dart';
import 'package:epi_space/SearchImages/SearchImagesRoute.dart';
import 'package:epi_space/news/NewsRssRoute.dart';
import 'package:flutter/material.dart';
import 'package:epi_space/fakenews/fake_news.dart';
import 'package:epi_space/fakenews/detail_page.dart';
import 'package:epi_space/quizz/quizz.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List fakenews_list;

  @override
  void initState() {
    fakenews_list = getFakeNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(FakeNews fakenews) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Image.asset(fakenews.imgPath, width: 50, height: 50),
      ),
      title: Text(
        fakenews.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(fakenews: fakenews)));
      },
    );

    Card makeCard(FakeNews fakenews) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(29, 31, 72, 0.9)),
        child: makeListTile(fakenews),
      ),
    );

    final makeBody = Container(
      //decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: fakenews_list.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(fakenews_list[index]);
        },
      ),
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(29, 31, 72, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.thumb_up, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsRssRoute()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.thumb_down, color: Colors.white),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.thumbs_up_down, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quizz()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.image, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageDayRoute()),
                );},
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchImagesRoute()),
                );
              },
            )
          ],
        ),
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(29, 31, 72, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        Image(
          image: AssetImage("assets/icon/logo.png")
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 31, 72, 1.0),
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}


List getFakeNews() {
  return [
    FakeNews(
        title: "Grèves : Thomas Pesquet se résout à faire le trajet à pied entre deux astéroïdes",
        imgPath: "assets/articles/1.jpg",
        intro: "Malgré la grève des transports, les Français déploient des "
            "ressources inattendues pour se rendre au travail. C’est le cas "
            "de l’astronaute Thomas Pesquet qui s’est résolu à faire le "
            "trajet à pied entre deux astéroïdes. Reportage.\n“En temps "
            "normal, je le fais en navette, mais ce matin ce sera scaphandre "
            "et combinaison j’ai l’impression !”, explique l’astronaute en "
            "s’aventurant hors du sas de décompression. “Bien sûr c’est plus "
            "long de quelques petites années-lumière mais regardez cette vue "
            "! Ça vaut le coup non ?” s’enthousiasme-t-il devant un "
            "magnifique clair de Terre.\n",
        content:
            "\nContrairement à d’autres "
            "astronautes, Thomas prend les grèves avec philosophie. “C’est "
            "l’occasion de faire un peu de sport, de s’aérer, d’entretenir "
            "ses réflexes” explique-t-il en évitant une pluie d’astéroïdes "
            "d’un habile salto. “Si on était dans Andromède où on risque de "
            "prendre une boule de feu à chaque trou noir, je dis pas… Mais "
            "ici c’est relax” ajoute le Français qui songe à faire le retour "
            "sur Terre à pied.\n\n“Même si les transports reviennent à la "
            "normale, je pense à continuer ce rythme, ça change de la cabine "
            "où on est sur nos écrans de contrôle toute la journée… Et puis "
            "franchement regardez la chance que nous avons ! Quel plaisir "
            "d’être ici ! Quel bonheur ! Respirez-moi cet air pur !” "
            "ajoute-t-il avant de déverrouiller son scaphandre et d’exploser "
            "en mille morceaux dans l’espace.\n"),
    FakeNews(
        title: "Donald Trump veut envoyer une mission habitée sur la face cachée du Soleil",
        imgPath: "assets/articles/2.jpg",
        intro: "Washington – Avant Mars et la Lune, le Soleil. Donald Trump"
            " a exhorté la NASA à envoyer une mission humaine habitée au plus"
            " vite vers la face cachée du Soleil, avant que les Russes ou les"
            " Chinois ne fassent de même et ne volent la domination "
            "américaine spatiale. Reportage.\n",
        content: "\n« Il y a beaucoup de choses à"
            " découvrir sur cette face cachée du Soleil, peut-être des choses"
            " que nous ne connaissons pas car elle est masquée, on ne la "
            "voit, elle est tout à fait derrière le Soleil, dans l’ombre » a "
            "souligné le président américain. « C’est comme la face cachée de"
            " la Lune, mais en mieux, très lumineux, très beau. Il y a sans "
            "doute des ressources à exploiter, il faut donc agir le plus "
            "rapidement possible avant que d’autres puissances étrangères "
            "malveillantes fassent de même » rappelant ainsi les précédentes "
            "missions chinoises sur la face cachée de la Lune. « L’Amérique "
            "sera la première nation à planter son fier et superbe, très "
            "beau, drapeau sur la face cachée du Soleil » a-t-il ajouté dans "
            "un tweet.\n\nConcernant les dangers de l’exposition à la chaleur"
            " de l’astre, le président a balayé les inquiétudes des "
            "scientifiques. « Il suffira d’appliquer sur les combinaisons de "
            "la crème solaire très forte, indice maximal, j’en utilise "
            "moi-aussi régulièrement et cela fonctionne, certaines sont très "
            "très puissantes » a-t-il précisé devant des scientifiques "
            "circonspects.\n"),
    FakeNews(
        title: "Suite à un accident sur l'astroroute de Mars, la circulation est rendue difficile entre Vénus et Jupiter",
        imgPath: "assets/articles/3.jpg",
        intro: "D’importants ralentissements sont à signaler à proximité de"
            " la Terre et de son satellite, les vaisseaux circulant sur cet "
            "axe sont invités à utiliser les itinéraires Bis.\n",
        content: "\nEn raison "
            "d’une collision avec un satellite d’observation terrien, la "
            "circulation est momentanément interrompue sur l’astroroute AZ "
            "455 qui passe directement à proximité de l’orbite de Mars. « "
            "Nous sommes en train de nettoyer la zone de tous débris spatiaux"
            " susceptibles de représenter un danger pour les coques des "
            "astronefs, dans l’immédiat nous vous invitons à utiliser les "
            "itinéraires de délestages autour de Jupiter et Vénus » a "
            "expliqué un responsable. Une situation qui complique les départs"
            " en vacances vers Bételgeuse et Alpha du Centaure et qui devrait"
            " durer encore quelques heures. À noter que la nouvelle bretelle "
            "d’autoroute spatiale initiée par les Vogons devrait être "
            "inauguré dès la semaine prochaine dès lors que les travaux de "
            "démolition de la Terre seront terminés.\n\n"),
    FakeNews(
        title: "La NASA découvre trois trottinettes abandonnées sur Mars",
        imgPath: "assets/articles/4.jpg",
        intro: "C’est une nouvelle qui risque de faire couler beaucoup "
            "d’encre : après la découverte de traces d’eau et d’oxygène par "
            "le robot Curiosity dans l’atmosphère martienne, le nouvel "
            "astromobile de la NASA a heurté la nuit dernière trois "
            "trottinettes parfaitement conservées.\n",
        content: "\nLes clichés ont "
            "rapidement fait le tour de la communauté scientifique et été "
            "passées au crible par les spécialistes. “Les trottinettes "
            "étaient accrochées les unes aux autres ce qui laisse penser que "
            "quelqu’un s’apprêtait à les recharger. Cela pourrait témoigner "
            "de la présence un jour d’intermittents du spectacle ou "
            "d’auto-entrepreneurs précaires” analyse un scientifique de la "
            "NASA.\n\nCette découverte est d’autant plus sensationnelle "
            "qu’elle va permettre au robot Opportunity d’explorer beaucoup "
            "plus aisément la planète rouge. “Nous avons chargé le robot sur "
            "les trottinettes pour qu’il puisse économiser de l’énergie et "
            "s’aventurer au-delà de ses capacités. Ça lui donne un petit air "
            "arrogant et parisien” s’amuse le professeur Kelly Richardson.\n"
            "\nDans cette optique, l’astromobile pourrait ainsi confirmer "
            "plusieurs hypothèses émises par la communauté scientifique. “Sur"
            " plusieurs clichés, on a cru apercevoir des emballages de chips "
            "et des canettes de Bavaria. Si Opportunity les atteint, nous "
            "pourrions avoir la preuve qu’il y a bel et bien eu des punks à "
            "chien un jour sur Mars” se surprend à rêver le professeur "
            "Richardson.\n\n"),
    FakeNews(
        title: "Pollution - Des micro-plastiques déjà détectés à l'intérieur du trou noir M87*",
        imgPath: "assets/articles/5.jpg",
        intro: "La fête aura été de courte durée. La joie de la découverte "
            "et de la première photo du trou noir M87* a été contrebalancée "
            "par les premiers signes d’une pollution massive aux "
            "micro-plastiques au sein même du trou noir. Reportage.\n",
        content: "\nLa "
            "faute à la diffusion massive des photos sur internet et sur les "
            "réseaux sociaux qui a provoqué un afflux massif de visiteurs aux"
            " abords du trou noir. Conséquence : le site est déjà très "
            "pollué, plusieurs agrégats stellaires vont devoir être fermés au"
            " public le temps que les responsables de l’agence spatiale "
            "européennes les nettoient. « C’est dramatique, on pensait que "
            "les gens seraient un peu plus responsables » explique Katie "
            "Bouman la scientifique qui a elle-même permis la photographie du"
            " trou noir. « Je lance un appel, ne venez pas saccager le trou "
            "noir, soyez respectueux de votre environnement ». On dénombre "
            "aussi plusieurs décès de personnes qui essayant de faire un "
            "selfie en se penchant sur le bord du trou noir ont vu leur "
            "matière irrémédiablement aspirée à l’intérieur et disparaître à "
            "jamais dans l’espace et le temps. En outre, on apprenait que des"
            " colleurs d’affiches de François Asselineau avaient commencé à "
            "recouvrir les parois du trou noir avec de larges affiches FREXIT"
            " ainsi que par des colleurs d’affiches de Nicolas Miguet.\n\n"),
    FakeNews(
        title: "Espace - Christophe Castaner présente son nouveau satellite "
          "lanceur de balles de défense",
        imgPath: "assets/articles/6.jpg",
        intro: "Paris – Le Ministère de l’intérieur a présenté en fanfare "
            "ce jour son nouveau « jouet », un satellite orbital lanceur de "
            "balles de défense (LBD)  capable depuis l’espace de lancer "
            "plusieurs balles de défense sur une manifestation non autorisée "
            "ou toute personne qui critique l’action de notre ministre de "
            "l’intérieur. Reportage.\n",
        content: "\nLe satellite sera placé en orbite "
            "géostationnaire, à près de 14 000 km d’altitude et sera à même "
            "de viser une personne avec une marge d’erreur réduite à 20 km. «"
            " Si vous n’avez rien à vous reprocher vous n’avez rien à "
            "craindre » a expliqué Christophe Castaner devant l’immense "
            "structure présentée au Centre spatial de Kourou. « Les tests ont"
            " montré des résultats encourageant et nous en lancerons une "
            "dizaine d’ici la fin de l’année, ce qui permettra de couvrir "
            "l’intégralité du territoire ». Autre projet présenté ce jour, un"
            " gigantesque canon lanceur de balles de défense, d’un diamètre "
            "de près de 70 mètres, capable d’un seul coup de projeter une "
            "balle sur la largeur d’une avenue parisienne. Pesant près de 4 "
            "tonnes de caoutchouc renforcé, la balle est propulsée à plus de "
            "150 m par secondes, permettant de neutraliser une manifestation "
            "en moins de 4 secondes.\n\n"),
    FakeNews(
        title: "La NASA envisage de faire exploser la Lune pour en étudier "
            "les conséquences",
        imgPath: "assets/articles/7.jpg",
        intro: "L’agence spatiale américaine a peut-être trouvé une "
            "nouvelle odyssée : faire exploser la Lune pour pouvoir mieux en "
            "étudier ses effets, et les conséquences de sa disparition.\n",
        content:
            "\nEdgar Phillips-Garret est l’homme qui se cache derrière cette "
            "idée folle d’envoyer sur la Lune une sonde équipée d’une charge "
            "explosive suffisamment forte pour définitivement la faire "
            "disparaître. « Nous avons été les premiers à poser le pied sur "
            "la Lune, nous sommes donc les plus légitimes pour décider du "
            "sort de cet endroit » explique le géophysicien avec un sourire "
            "de malice. Au delà d’une simple question de propriété, Edgar "
            "Phillips-Garret donne à son projet une vraie valeur scientifique"
            ". « Des questions seront résolues : nous seront enfin fixés sur "
            "le caractère indispensable ou non de la Lune » affirme-t-il. "
            "Entièrement financées par des fonds privés, ces recherches "
            "pourraient offrir à une partie de la communauté scientifique de "
            "quoi s’occuper pendant les 30 prochaines années.\n\n"),
    FakeNews(
        title: "Une nouvelle planète inutile découverte super loin de chez nous",
        imgPath: "assets/articles/8.jpg",
        intro: "Hier soir, la Nasa a confirmé la découverte d’une nouvelle "
            "planète baptisée Kepler 4567. Une planète à des millions d’années "
            "lumière, inhabitable, et donc totalement inutile.\n",
        content:
            "Toutes les rédactions de revues d’astronomie saluaient hier la "
            "découverte d’une nouvelle planète. « C’est une planète recouverte "
            "de gaz et de lave, la température y avoisine les 500 degrés le "
            "jour et, les – 300 degrés la nuit. La vie y est totalement "
            "impossible, le paysage, toujours le même. Aucun vaisseau n’a la "
            "capacité de s’y rendre. Quelle découverte incroyable ! » "
            "s’extasiait Jean-René, astronome français.La nouvelle planète a "
            "été le résultat de plus de 50 ans de recherches, et de plus de "
            "800 millions d’euros de dépenses. Elle est totalement invisible "
            "à l’œil nu ; seuls deux télescopes peuvent l’observer dont "
            "l’utilisation est strictement réservée aux astronomes. Les "
            "photos prises de la planète ne donnent absolument rien à cause de "
            "la position de son soleil. « Son inutilité est complète, c’est un "
            "moment magique pour moi » confirme Marc, qui a travaillé sur le "
            "projet, tout en mettant un Post-it avec le nom de la planète sur "
            "sa carte des étoiles que seul lui peut comprendre.\n"
            "Suite à la découverte de cette planète, nous n’en savons donc "
            "pas plus sur l’origine de la vie, ni sur la présence d’autres "
            "civilisations ou même sur l’espoir, qu’un jour, peut être, nous "
            "pourrions nous rendre sur une exoplanète habitable. Une preuve "
            "encore que l’espace n’a pas fini de nous livrer des secrets "
            "totalement inutiles.\n\n"),
    FakeNews(
        title: "Celui qui affiche le logo de la NASA sur son t-shirt n’a en "
            "fait jamais mis un pied dans l’espace",
        imgPath: "assets/articles/10.png",
        intro: "Un jeune homme a déçu tout son entourage après qu’il a avoué "
            "que malgré le logo « NASA » sur son t-shirt, il n’avait jamais "
            "mis un pied dans l’espace. Récit.\n",
        content: "C’est un drôle de sentiment qui a envahi Léonard lorsqu’il a lu "
            "une déception unanime dans les yeux de ses camarades : « Je n’aurai "
            "jamais pu imaginer qu’ils pensaient tous que je travaillais "
            "réellement à la NASA, à cause de ce t-shirt. Mon ami Malo porte "
            "tous les jours un haut de la marque Ralph Lauren et pourtant je "
            "sais qu’il n’a jamais joué au polo de sa vie » soupire-t-il"
            "rongé par les remords.\n"
            "« Il aurait pu nous le dire, quand même. Si j’avais su je ne "
            "l’aurais jamais invité à mon anniversaire. Je trouvais ça classe "
            "d’avoir un ami de la NASA, au lieu de ça ce n’est un vulgaire élève "
            "de Sciences Po. Quelle déception ! » s’insurge Pierre, ami de "
            "Léonard depuis presque 10 ans. Lorsqu’on interroge d’autres de ses "
            "connaissances, le ton est le même, un mot revient sans cesse : "
            "« trahison ».\n"
            "L’intéressé est dépité par la situation : « Après leur avoir avoué "
            "que je n’avais jamais mis un pied dans l’espace, j’ai pris les "
            "devants et avoué que malgré mes baskets Adidas, je n’avais jamais "
            "participé à une grande compétition sportive. Ça a été la goutte qui "
            "a fait déborder le vase. Je n’ai plus aucun ami » termine Léonard, "
            "dans un sanglot, en tenant sa tête entre ses mains. Tête habillée "
            "d’une casquette des Yankees de New-York, sans doute le souvenir "
            "d’une carrière professionnelle dans le baseball.\n\n"),
    ];
}
