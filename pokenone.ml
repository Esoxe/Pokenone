type capacite ={
nom : string ;
degat : int  
}

type t_element = |Eau |Feu |Nature |Terre |Air |Bagarre |Sombre |Magie |Dragon |Nucleaire

type pokenone = {
nom : string ;
element : t_element ;
rarete : int ;
numero_pokedex : int ;
mutable attaque : int ;
mutable defense : int ;
mutable vitesse : int ;
mutable sort1 : capacite ;
mutable sort2 : capacite 
}


(*initialisation de toutes les capacité du jeu *)
let capacite_sombre = [{nom="Cursed Body";degat=30};{nom="Shadow Punch";degat=60};{nom="Phantom Force";degat=50};{nom="Nightmare";degat=40};{nom="Hex";degat=20};{nom="Malicious Moonsault";degat=80}]
let capacite_eau = [{nom="Aqua Jet";degat=30};{nom="Aqua Tail";degat=60};{nom="Bubble";degat=50};{nom="Waterfall";degat=40};{nom="Water Sprout";degat=20};{nom="Liquidation";degat=80}]
let capacite_feu = [{nom="Fire Blast";degat=30};{nom="Fire Spin";degat=60};{nom="Pyro Ball";degat=50};{nom="Overheat";degat=40};{nom="Heat Wave";degat=20};{nom="Flame Wheel";degat=80}]
let capacite_nature = [{nom="Bullet Seed";degat=30};{nom="Cotton Spore";degat=60};{nom="Giga Drain";degat=50};{nom="Wood Hammer";degat=40};{nom="Bug Bite";degat=20};{nom="X-Scissor";degat=80}]
let capacite_terre = [{nom="Dig";degat=30};{nom="Earthquake";degat=60};{nom="Tectonic Rage";degat=50};{nom="Bulldoze";degat=40};{nom="Rock Throw";degat=20};{nom="Stone Axe";degat=80}]
let capacite_air = [{nom="Aeroblast";degat=30};{nom="Air Slash";degat=60};{nom="Brave Bird";degat=50};{nom="Fly";degat=40};{nom="Wing Attack";degat=20};{nom="Hurricane";degat=80}]
let capacite_bagarre = [{nom="Axe Kick";degat=30};{nom="Brick Break";degat=60};{nom="Close Combat";degat=50};{nom="Double Kick";degat=40};{nom="Focus Punch";degat=20};{nom="High Jump Kick";degat=80}]
let capacite_magie = [{nom="Genesis Supernova";degat=30};{nom="Mist Ball";degat=60};{nom="Magic Powder";degat=50};{nom="Hyperspace Hole";degat=40};{nom="Spirit break";degat=20};{nom="Moon Blast";degat=80}]
let capacite_dragon = [{nom="Draco Meteor";degat=30};{nom="Dragon Breath";degat=60};{nom="Dragon Rage";degat=50};{nom="Dragon Tail";degat=40};{nom="Dragon Rush";degat=20};{nom="Roar of Time";degat=80}]
let capacite_nucleaire = [{nom="Plasma Jet";degat=30};{nom="Radioactive Gas";degat=60};{nom="Radioactive Spread";degat=50};{nom="Internal Fusion";degat=40};{nom="Radioactive Cannon";degat=20};{nom="Atomic missile";degat=80}]

(* initialisation de tous les pokemon du jeu *)
let pokenone1 ={nom ="Quirkoko";element=Sombre;rarete=1;numero_pokedex=1;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone2 ={nom ="Lampika";element=Magie;rarete=1;numero_pokedex=2;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone3 ={nom ="cragon";element=Dragon;rarete=1;numero_pokedex=3;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone4 ={nom ="Bellenobi";element=Eau;rarete=1;numero_pokedex=4;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone5 ={nom ="Atlascar";element=Bagarre;rarete=1;numero_pokedex=5;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone6 ={nom ="Prankatoo";element=Air;rarete=1;numero_pokedex=6;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone7 ={nom ="Wreckoon";element=Terre;rarete=1;numero_pokedex=7;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone8 ={nom ="Chopetal";element=Nature;rarete=1;numero_pokedex=8;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone9 ={nom ="Anticoot";element=Nature;rarete=1;numero_pokedex=9;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone10 ={nom ="Commodeen";element=Nucleaire;rarete=3;numero_pokedex=10;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone11 ={nom ="Driftangle";element=Air;rarete=1;numero_pokedex=11;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone12 ={nom ="Ponditz";element=Air;rarete=2;numero_pokedex=12;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone13 ={nom ="Gustick";element=Terre;rarete=1;numero_pokedex=13;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone14 ={nom ="Cursqueak";element=Bagarre;rarete=1;numero_pokedex=14;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone15 ={nom ="Pigale";element=Air;rarete=3;numero_pokedex=15;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone16 ={nom ="Serpenatee";element=Nature;rarete=2;numero_pokedex=16;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone17 ={nom ="Germith";element=Terre;rarete=2;numero_pokedex=17;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone18 ={nom ="Stormew";element=Sombre;rarete=1;numero_pokedex=18;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone19 ={nom ="Torrentrash";element=Magie;rarete=1;numero_pokedex=19;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone20 ={nom ="Scorprickle";element=Bagarre;rarete=2;numero_pokedex=20;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone21 ={nom ="Glisdisc";element=Magie;rarete=2;numero_pokedex=21;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone22 ={nom ="Golemidge";element=Terre;rarete=3;numero_pokedex=22;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone23 ={nom ="Elekick";element=Bagarre;rarete=3;numero_pokedex=23;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone24 ={nom ="Twigrouse";element=Feu;rarete=1;numero_pokedex=24;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone25 ={nom ="Bantamal";element=Feu;rarete=1;numero_pokedex=25;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone26 ={nom ="Duradiva";element=Nature;rarete=3;numero_pokedex=26;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone27 ={nom ="Septicoral";element=Dragon;rarete=1;numero_pokedex=27;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone28 ={nom ="Venopal";element=Sombre;rarete=2;numero_pokedex=28;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone29 ={nom ="Nihilith";element=Dragon;rarete=2;numero_pokedex=29;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone30 ={nom ="Nemarius";element=Dragon;rarete=3;numero_pokedex=30;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone31 ={nom ="Dumpion";element=Bagarre;rarete=4;numero_pokedex=31;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone32 ={nom ="Bahamew";element=Magie;rarete=3;numero_pokedex=32;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone33 ={nom ="Floofrog";element=Eau;rarete=1;numero_pokedex=33;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone34 ={nom ="Vulturing";element=Feu;rarete=2;numero_pokedex=34;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone35 ={nom ="Featherey";element=Nucleaire;rarete=3;numero_pokedex=35;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone36 ={nom ="Emperosa";element=Nature;rarete=4;numero_pokedex=36;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}} 
let pokenone37 ={nom ="Primare";element=Eau;rarete=2;numero_pokedex=37;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone38 ={nom ="Seasonoir";element=Terre;rarete=4;numero_pokedex=38;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone39 ={nom ="Dryadoll";element=Dragon;rarete=4;numero_pokedex=39;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone40 ={nom ="Gladiufus";element=Feu;rarete=3;numero_pokedex=40;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone41 ={nom ="Aresage";element=Sombre;rarete=3;numero_pokedex=41;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone42 ={nom ="Minimurai";element=Nucleaire;rarete=4;numero_pokedex=42;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone43 ={nom ="Gongenta";element=Terre;rarete=5;numero_pokedex=43;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone44 ={nom ="Zigzagoat";element=Air;rarete=4;numero_pokedex=44;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone45 ={nom ="Maximagnus";element=Nucleaire;rarete=4;numero_pokedex=45;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone46 ={nom ="Robberai";element=Nucleaire;rarete=5;numero_pokedex=46;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone47 ={nom ="Sprintugu";element=Sombre;rarete=4;numero_pokedex=47;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone48 ={nom ="Crushark";element=Eau;rarete=3;numero_pokedex=48;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone49 ={nom ="Elegander";element=Nucleaire;rarete=5;numero_pokedex=49;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone50 ={nom ="Verdink";element=Nature;rarete=5;numero_pokedex=50;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone51 ={nom ="Birdusa";element=Air;rarete=5;numero_pokedex=51;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone52 ={nom ="Avataur";element=Bagarre;rarete=5;numero_pokedex=52;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone53 ={nom ="Aranarl";element=Magie;rarete=4;numero_pokedex=53;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone54 ={nom ="Sweetox";element=Sombre;rarete=5;numero_pokedex=54;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone55 ={nom ="Macroops";element=Eau;rarete=4;numero_pokedex=55;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone56 ={nom ="Salamonk";element=Feu;rarete=4;numero_pokedex=56;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone57 ={nom ="Precipox";element=Feu;rarete=5;numero_pokedex=57;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone58 ={nom ="Panichidna";element=Eau;rarete=5;numero_pokedex=58;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone59 ={nom ="Cursiege";element=Magie;rarete=5;numero_pokedex=59;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokenone60 ={nom ="Tremorosa";element=Dragon;rarete=5;numero_pokedex=60;attaque=1;defense=1;vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1}}
let pokedex = [|pokenone1;pokenone2;pokenone3;pokenone4;pokenone5;pokenone6;pokenone7;pokenone8;pokenone9;pokenone10;pokenone11;pokenone12;pokenone13;pokenone14;pokenone15;pokenone16;pokenone17;pokenone18;pokenone19;pokenone20;pokenone21;pokenone22;pokenone23;pokenone24;pokenone25;pokenone26;pokenone27;pokenone28;pokenone29;pokenone30;pokenone31;pokenone32;pokenone33;pokenone34;pokenone35;pokenone36;pokenone37;pokenone38;pokenone39;pokenone40;pokenone41;pokenone42;pokenone43;pokenone44;pokenone45;pokenone46;pokenone47;pokenone48;pokenone49;pokenone50;pokenone51;pokenone52;pokenone53;pokenone54;pokenone55;pokenone56;pokenone57;pokenone58;pokenone58;pokenone59;pokenone60|]

(*generation de capacité aléatoire*)
let capacite_aleatoire element = 
  let x = Random.int (List.length capacite_sombre) in
  match element with 
  |Eau -> List.nth capacite_eau x
  |Feu -> List.nth capacite_feu x
  |Nature -> List.nth capacite_nature x
  |Terre -> List.nth capacite_terre x
  |Air -> List.nth capacite_air x
  |Bagarre -> List.nth capacite_bagarre x
  |Sombre -> List.nth capacite_sombre x
  |Magie -> List.nth capacite_magie x
  |Dragon -> List.nth capacite_dragon x
  |_ -> List.nth capacite_nucleaire x


(*générateur aléatoire*)


(*Generation des statistique*)
let stats_starter starter =
  let x = ref 0 in
  match starter.rarete with
  |1 -> while !x = 0 do x:= Random.int 21 done ; !x
  |2 -> while !x <=3 do x:= Random.int 21 done ; !x
  |3 -> while !x < 8 do x:= Random.int 21 done ; !x
  |4 -> while !x <12 do x:= Random.int 21 done ; !x
  |5 -> while !x <16 do x:= Random.int 21 done ; !x
  |_ -> failwith "rarete inconnu" 




  