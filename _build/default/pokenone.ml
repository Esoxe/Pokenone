type capacite ={
nom : string ;
degat : int  
}
type niveau = {
  mutable valeur : int ;
  mutable actuel : int 
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
mutable niveau : niveau ;
mutable sort1 : capacite ;
mutable sort2 : capacite ;
mutable pv : int
} 

let h_rectangle_page = ref 42.
let w_rectangle_page = 334.
let y_enter = ref 360 
let rec_herbe = Raylib.Rectangle.create 0. (-980.) 800. 1000. 
let rec_terre = Raylib.Rectangle.create 0. (-3000.) 800. 1000.
let rec_montagne = Raylib.Rectangle.create 0. (-4000.) 800. 1000.
let l_combat_collision = [rec_herbe;rec_terre;rec_montagne]
let niveau_sauvage = ref 98

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
let pokenone1 ={nom ="Quirkoko";element=Sombre;rarete=1;numero_pokedex=1;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone2 ={nom ="Lampika";element=Magie;rarete=1;numero_pokedex=2;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone3 ={nom ="cragon";element=Dragon;rarete=1;numero_pokedex=3;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone4 ={nom ="Bellenobi";element=Eau;rarete=1;numero_pokedex=4;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone5 ={nom ="Atlascar";element=Bagarre;rarete=1;numero_pokedex=5;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone6 ={nom ="Prankatoo";element=Air;rarete=1;numero_pokedex=6;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone7 ={nom ="Wreckoon";element=Terre;rarete=1;numero_pokedex=7;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone8 ={nom ="Chopetal";element=Nature;rarete=1;numero_pokedex=8;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone9 ={nom ="Anticoot";element=Nature;rarete=1;numero_pokedex=9;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone10 ={nom ="Commodeen";element=Nucleaire;rarete=3;numero_pokedex=10;attaque=1;defense=1;niveau={valeur=1;actuel=0};vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone11 ={nom ="Driftangle";element=Air;rarete=1;numero_pokedex=11;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone12 ={nom ="Ponditz";element=Air;rarete=2;numero_pokedex=12;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone13 ={nom ="Gustick";element=Terre;rarete=1;numero_pokedex=13;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone14 ={nom ="Cursqueak";element=Bagarre;rarete=1;numero_pokedex=14;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone15 ={nom ="Pigale";element=Air;rarete=3;numero_pokedex=15;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone16 ={nom ="Serpenatee";element=Nature;rarete=2;numero_pokedex=16;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone17 ={nom ="Germith";element=Terre;rarete=2;numero_pokedex=17;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone18 ={nom ="Stormew";element=Sombre;rarete=1;numero_pokedex=18;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone19 ={nom ="Torrentrash";element=Magie;rarete=1;numero_pokedex=19;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone20 ={nom ="Scorprickle";element=Bagarre;rarete=2;numero_pokedex=20;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone21 ={nom ="Glisdisc";element=Magie;rarete=2;numero_pokedex=21;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone22 ={nom ="Golemidge";element=Terre;rarete=3;numero_pokedex=22;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone23 ={nom ="Elekick";element=Bagarre;rarete=3;numero_pokedex=23;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone24 ={nom ="Twigrouse";element=Feu;rarete=1;numero_pokedex=24;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone25 ={nom ="Bantamal";element=Feu;rarete=1;numero_pokedex=25;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone26 ={nom ="Duradiva";element=Nature;rarete=3;numero_pokedex=26;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone27 ={nom ="Septicoral";element=Dragon;rarete=1;numero_pokedex=27;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone28 ={nom ="Venopal";element=Sombre;rarete=2;numero_pokedex=28;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone29 ={nom ="Nihilith";element=Dragon;rarete=2;numero_pokedex=29;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone30 ={nom ="Nemarius";element=Dragon;rarete=3;numero_pokedex=30;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone31 ={nom ="Dumpion";element=Bagarre;rarete=4;numero_pokedex=31;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone32 ={nom ="Bahamew";element=Magie;rarete=3;numero_pokedex=32;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone33 ={nom ="Floofrog";element=Eau;rarete=1;numero_pokedex=33;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone34 ={nom ="Vulturing";element=Feu;rarete=2;numero_pokedex=34;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone35 ={nom ="Featherey";element=Nucleaire;rarete=3;numero_pokedex=35;attaque=1;defense=1;niveau={valeur=1;actuel=0};vitesse=1;sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone36 ={nom ="Emperosa";element=Nature;rarete=4;numero_pokedex=36;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20} 
let pokenone37 ={nom ="Primare";element=Eau;rarete=2;numero_pokedex=37;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone38 ={nom ="Seasonoir";element=Terre;rarete=4;numero_pokedex=38;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone39 ={nom ="Dryadoll";element=Dragon;rarete=4;numero_pokedex=39;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone40 ={nom ="Gladiufus";element=Feu;rarete=3;numero_pokedex=40;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone41 ={nom ="Aresage";element=Sombre;rarete=3;numero_pokedex=41;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone42 ={nom ="Minimurai";element=Nucleaire;rarete=4;numero_pokedex=42;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone43 ={nom ="Gongenta";element=Terre;rarete=5;numero_pokedex=43;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone44 ={nom ="Zigzagoat";element=Air;rarete=4;numero_pokedex=44;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone45 ={nom ="Maximagnus";element=Nucleaire;rarete=4;numero_pokedex=45;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone46 ={nom ="Robberai";element=Nucleaire;rarete=5;numero_pokedex=46;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone47 ={nom ="Sprintugu";element=Sombre;rarete=4;numero_pokedex=47;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone48 ={nom ="Crushark";element=Eau;rarete=3;numero_pokedex=48;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone49 ={nom ="Elegander";element=Nucleaire;rarete=5;numero_pokedex=49;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone50 ={nom ="Verdink";element=Nature;rarete=5;numero_pokedex=50;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone51 ={nom ="Birdusa";element=Air;rarete=5;numero_pokedex=51;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone52 ={nom ="Avataur";element=Bagarre;rarete=5;numero_pokedex=52;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone53 ={nom ="Aranarl";element=Magie;rarete=4;numero_pokedex=53;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone54 ={nom ="Sweetox";element=Sombre;rarete=5;numero_pokedex=54;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone55 ={nom ="Macroops";element=Eau;rarete=4;numero_pokedex=55;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone56 ={nom ="Salamonk";element=Feu;rarete=4;numero_pokedex=56;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone57 ={nom ="Precipox";element=Feu;rarete=5;numero_pokedex=57;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone58 ={nom ="Panichidna";element=Eau;rarete=5;numero_pokedex=58;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone59 ={nom ="Cursiege";element=Magie;rarete=5;numero_pokedex=59;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokenone60 ={nom ="Tremorosa";element=Dragon;rarete=5;numero_pokedex=60;attaque=1;defense=1;vitesse=1;niveau={valeur=1;actuel=0};sort1={nom="";degat=1};sort2={nom="";degat=1};pv=20}
let pokedex = [|pokenone1;pokenone2;pokenone3;pokenone4;pokenone5;pokenone6;pokenone7;pokenone8;pokenone9;pokenone10;pokenone11;pokenone12;pokenone13;pokenone14;pokenone15;pokenone16;pokenone17;pokenone18;pokenone19;pokenone20;pokenone21;pokenone22;pokenone23;pokenone24;pokenone25;pokenone26;pokenone27;pokenone28;pokenone29;pokenone30;pokenone31;pokenone32;pokenone33;pokenone34;pokenone35;pokenone36;pokenone37;pokenone38;pokenone39;pokenone40;pokenone41;pokenone42;pokenone43;pokenone44;pokenone45;pokenone46;pokenone47;pokenone48;pokenone49;pokenone50;pokenone51;pokenone52;pokenone53;pokenone54;pokenone55;pokenone56;pokenone57;pokenone58;pokenone58;pokenone59;pokenone60|]


let ban_key key = 
let test = ref true in
match key with
|7 -> test := false  ; !test
|8 -> test := false  ; !test
|22 -> test := false ; !test
|35 -> test := false ; !test
|44 -> test := false ; !test
|_ -> () ; !test


let is_any_key_pressed () =
let open Raylib in
let key_pressed = ref false in
let key = Key.to_int(get_key_pressed ()) in

if key >0 && ban_key key then  key_pressed := true ; !key_pressed 


let draw_element pokenone y x = 
  let open Raylib in
  let x' = x+233 in
  let element = pokenone.element in
  let rec_element = Rectangle.create (float_of_int(x)+.222.) (float_of_int(y)-.4.) 70. 25. in
  match element with 
  |Eau -> draw_rectangle_rec rec_element Color.blue ; draw_text "EAU" x' (y) 20 Color.black
  |Feu -> draw_rectangle_rec rec_element Color.red ; draw_text "FEU" x' (y) 20 Color.black
  |Nature -> draw_rectangle_rec rec_element Color.green ; draw_text "NATURE" (x'-8) (y+3) 15 Color.black
  |Terre -> draw_rectangle_rec rec_element Color.brown ; draw_text "TERRE" (x'-5) (y+3) 15 Color.black
  |Air -> draw_rectangle_rec rec_element Color.skyblue ; draw_text "AIR" x' y 20 Color.black
  |Bagarre -> draw_rectangle_rec rec_element Color.orange ; draw_text "BAGARRE" (x'-8) (y+3) 13 Color.black
  |Sombre -> draw_rectangle_rec rec_element Color.black ; draw_text "SOMBRE" (x'-8) (y+2) 15 Color.white
  |Magie -> draw_rectangle_rec rec_element Color.purple ; draw_text "MAGIE" (x'-9) (y) 20 Color.black
  |Dragon -> draw_rectangle_rec rec_element Color.darkblue ; draw_text "DRAGON" (x'-8) (y+3) 15 Color.black
  |_ -> draw_rectangle_rec rec_element Color.yellow ; draw_text "NUCLEAIRE" (x'-8) (y+4) 11 Color.black


let setup_rectangle_page x y w h line_thic ball a zone =
let open Raylib in
  let y'=int_of_float y +13 in
  let x'=int_of_float x +10 in
  let rec_niveau = Rectangle.create x y w !h  in
  let rec_attaque = Rectangle.create x (y+. !h) w !h in
  let rec_defense = Rectangle.create x (y+.2.*. !h) w !h in
  let rec_vitesse = Rectangle.create x (y+.3.*. !h) w !h in
  draw_rectangle_rec rec_niveau Color.lightgray ;draw_rectangle_lines_ex rec_niveau line_thic Color.darkgray ;
  draw_rectangle_rec rec_attaque Color.lightgray ;draw_rectangle_lines_ex rec_attaque line_thic Color.darkgray ;
  draw_rectangle_rec rec_defense Color.lightgray ;draw_rectangle_lines_ex rec_defense line_thic Color.darkgray ;
  draw_rectangle_rec rec_vitesse Color.lightgray ;draw_rectangle_lines_ex rec_vitesse line_thic Color.darkgray ;
  draw_text (a.(ball).nom) x' (y') 20 Color.black ;
  draw_text ("lvl : "^string_of_int(a.(ball).niveau.valeur)) (x'+140) (y') 20 Color.black ;
  draw_element a.(ball) y' x' ;
  if zone = 0 then begin
   draw_text ("Attaque : "^string_of_int(a.(ball).attaque)) x' ((y'+(Int.of_float !h))) 20 Color.black ;
   draw_text ("Defense : "^string_of_int(a.(ball).defense)) x' ((y'+2*(Int.of_float !h))) 20 Color.black ;
   draw_text ("Vitesse : "^string_of_int(a.(ball).vitesse)) x'  ((y'+3*(Int.of_float !h))) 20 Color.black 
  end
 else begin
  draw_text ("Atq : "^string_of_int(a.(ball).attaque)) x' (y'+(Int.of_float !h)) 20 Color.black ;
  draw_text ("Def : "^string_of_int(a.(ball).defense)) (x'+120) (y'+(Int.of_float !h)) 20 Color.black ;
  draw_text ("Vit : "^string_of_int(a.(ball).vitesse)) (x'+225) (y'+(Int.of_float !h)) 20 Color.black ;
  draw_text ("Capacité : "^(a.(ball).sort1.nom^" "^string_of_int(a.(ball).sort1.degat))) x' (y'+2*(Int.of_float !h)) 20 Color.black ;
  if a.(ball).niveau.valeur >= 10 then
  draw_text ("Capacité : "^(a.(ball).sort2.nom^" "^string_of_int(a.(ball).sort2.degat))) x' (y'+3*(Int.of_float !h)) 20 Color.black
 end

    
let draw_pokenone l_texture n ball a zone camera x =
  let open Raylib in
  if ball < 3 || zone >0 then begin let y = (Vector2.y(Camera2D.target camera)-.250.) in
                   draw_texture (List.nth l_texture (n+(a.(ball).numero_pokedex))) (int_of_float x) (int_of_float(y)) Color.white ; 
                   setup_rectangle_page x (y+.w_rectangle_page) w_rectangle_page h_rectangle_page 5. ball a zone ;
                   if zone <> 0 then y_enter :=700 ;
                   draw_text "Appuyer sur " 346 !y_enter 25 Color.black ; draw_text "Enter" 346 (!y_enter+40) 25 Color.black ;draw_text "Pour confirmer " 346 (!y_enter+80) 25 Color.black end 





let nb_pokenone = ref 0
let equipe_actuelle = ref ([||])
let pokenone_sauvage_herbe =  ref [||]
let pokenone_sauvage_terre = ref [||]
let pokenone_sauvage_montagne = ref [||]


let ajoute_pokenone pokenone x y' = 
  let equipe_pokenone = 
    let new_pokenone = Array.make 1 pokenone1 in
    Array.append !equipe_actuelle new_pokenone
  in
  if !nb_pokenone <6  then begin
  nb_pokenone := !nb_pokenone + 1 ;
  equipe_actuelle := equipe_pokenone ;
  !equipe_actuelle.(!nb_pokenone-1) <- pokenone ;
  if x = 2 then Raylib.draw_text "Capture reussi" 400 (y'-50) 30 Raylib.Color.black ;
  end




(*generation de capacité aléatoire*)
let capacite_aleatoire element = 
  let x = Raylib.get_random_value 0 (List.length capacite_sombre-1) in
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


(*Generation des statistique*)
let stat_aleatoire pokenone =
  let open Raylib in
  let x = ref 0 in
  match pokenone.rarete with
  |1 -> x:= get_random_value 1 5 ;  !x
  |2 -> x:= get_random_value 5 8  ; !x
  |3 -> x:= get_random_value 8 12 ; !x
  |4 -> x:= get_random_value 12 16  ; !x
  |5 -> x:= get_random_value 16 20  ; !x
  |_ -> failwith "rarete inconnu" 

  let point_de_vie_max pokenone =
    match pokenone.rarete,pokenone.niveau.valeur with
    |_,1 -> 20
    |1,_ -> int_of_float( 20. +. (400./.99. *. (float_of_int (pokenone.niveau.valeur))))
    |2,_ -> int_of_float( 20. +. (430./.99. *. (float_of_int (pokenone.niveau.valeur))))
    |3,_ -> int_of_float( 20. +. (450./.99. *. (float_of_int (pokenone.niveau.valeur))))
    |4,_ -> int_of_float( 20. +. (470./.99. *. (float_of_int (pokenone.niveau.valeur))))
    |5,_ -> int_of_float( 20. +. (500./.99. *. (float_of_int (pokenone.niveau.valeur))))
    |_,_ -> failwith "rarete inconnu"
    
let update_xp xp pokenone =
  if pokenone.niveau.actuel + xp > pokenone.niveau.valeur * 20 then begin pokenone.niveau.actuel <- pokenone.niveau.actuel +20 -(pokenone.niveau.valeur *20) ;
                                                                          pokenone.niveau.valeur <- pokenone.niveau.valeur +1 end
                                                                    else pokenone.niveau.actuel <- pokenone.niveau.valeur + xp 


 let update_pokenone () =
   for i =0 to Array.length !equipe_actuelle -1 do
    !equipe_actuelle.(i).pv <- !equipe_actuelle.(i).pv+((point_de_vie_max (!equipe_actuelle.(i))) - !equipe_actuelle.(i).pv) ;
   done

  let update_sauvage a =
    for i =0 to Array.length a -1 do
      a.(i).pv <- a.(i).pv+(point_de_vie_max (a.(i)) - a.(i).pv)
    done
 

let draw_hpbar x y w h pokenone =
  let open Raylib in
  let rectangle_vie = Rectangle.create (float_of_int(x)) (float_of_int(y)) (float_of_int(w)*.(float_of_int(pokenone.pv)/.float_of_int (point_de_vie_max pokenone))) (float_of_int (h)) in
  draw_rectangle x y w h Color.lightgray ;
  draw_rectangle (x-30) y 30 h Color.black ;
  draw_text "HP" (x-28) y 20 Color.yellow ;
  draw_rectangle_rec rectangle_vie Color.lime ;
  draw_rectangle_lines x y w h Color.gray


(*random pokenone**)
let rec random_pokemon a x y zone sauvage  =
  let x' = Raylib.get_random_value x y  in
  let starter = a.(x') in
  match starter.element,starter.rarete with
  |_,1 when zone <1 -> random_pokemon a x y  zone sauvage 
  |_,2 when zone < 1 -> random_pokemon a x y zone sauvage 
  |_,4 when zone < 1 -> random_pokemon a x y zone sauvage 
  |_,5 when zone < 1 -> random_pokemon a x y zone sauvage 
  |Nucleaire,_ -> random_pokemon  a x y zone sauvage 
  |_ -> starter.sort1 <- capacite_aleatoire starter.element ; 
              starter.attaque <- stat_aleatoire starter ;
              starter.defense <- stat_aleatoire starter ;
              starter.vitesse <- stat_aleatoire starter ;
              if zone >0 then starter.sort2 <- capacite_aleatoire starter.element ;
              if zone >0 && sauvage then begin starter.niveau.valeur <- !niveau_sauvage ;starter.pv <- point_de_vie_max starter end ;
              starter

let nb_sauvage = ref 0  
              
let remplie_liste t = let create =let new_pokenone = Array.make 1 pokenone1 in
  Array.append !pokenone_sauvage_herbe new_pokenone in
  nb_sauvage := !nb_sauvage +1 ;
  pokenone_sauvage_herbe := create ;
  !pokenone_sauvage_herbe.(!nb_sauvage-1) <- t  
              
let liste_trieur t =
  match t.element with
  |Eau -> remplie_liste t
  |Nature -> remplie_liste t
  |Air -> remplie_liste t
  |_ -> ()

let rec initialisation_sauvage_herbe l = 
   match l with
  |[] -> ()
  |t::q -> liste_trieur t ; initialisation_sauvage_herbe q
 


    let initialisation_sauvage_terre () = 
  
      for i=0 to Array.length pokedex -1 do
       let cpt = ref 0 in
       if pokedex.(i).element = Terre || pokedex.(i).element=Bagarre || pokedex.(i).element=Feu then begin 
                                                      let ajoute_pokenone = 
                                                        let new_pokenone = Array.make 1 pokenone1 in
                                                      Array.append !pokenone_sauvage_terre new_pokenone in
                                                      cpt := !cpt +1 ;
                                                      pokenone_sauvage_terre := ajoute_pokenone ;
                                                      !pokenone_sauvage_terre.(!cpt-1) <- pokedex.(i) ;
       end
      done 
 let initialisation_sauvage_montagne () = 
  for i=0 to Array.length pokedex -1 do
     let cpt = ref 0 in
     if pokedex.(i).element = Sombre || pokedex.(i).element=Dragon || pokedex.(i).element=Magie then begin 
       let ajoute_pokenone = 
       let new_pokenone = Array.make 1 pokenone1 in
       Array.append !pokenone_sauvage_montagne new_pokenone in
       cpt := !cpt +1 ;
       pokenone_sauvage_montagne := ajoute_pokenone ;
      !pokenone_sauvage_montagne.(!cpt-1) <- pokedex.(i) ;
    end
  done 

 let spawn_sauvage t zone l =
    let a = pokenone_sauvage_herbe in
    if t = (List.nth l 0) then  a := !pokenone_sauvage_herbe
    else if t= (List.nth l 1) then a := !pokenone_sauvage_terre
    else  a := !pokenone_sauvage_montagne ;
    let x = Raylib.get_random_value 0 99 in
     match x with 
     |_ when x <50 -> random_pokemon !a 0 5 zone true  
     |_ when x  <75 -> random_pokemon !a 6 8 zone true 
     |_ when x  <90 -> random_pokemon !a 9 11 zone true 
     |_ when x  <98 -> random_pokemon !a 12 14 zone true        
     |_  ->random_pokemon !a 15 17 zone true 


(*variable gloable gestion combat*)     
let proc = ref 0 
let key_pressed = ref 0 
let sauvage = [|pokenone6|] 
let screen = ref 0
let timer = ref 0. 
let equipe_open = ref false

let capture_echoue pokenone =
  screen := !screen +1 ;
  let sort_ia = ref (pokenone.sort1) in
  let x = Raylib.get_random_value 1 2 in
  if pokenone.niveau.valeur >=10 && x=2 then sort_ia :=sauvage.(0).sort2 ;
  !equipe_actuelle.(0).pv <- !equipe_actuelle.(0).pv - ! sort_ia.degat 

let capture pokenone y' = 
  let x = Raylib.get_random_value 0 99 in
  match pokenone.rarete with
  |1 -> if x > 50 then begin ajoute_pokenone pokenone 2 y' ;screen := 3 ; key_pressed:=1 end else capture_echoue pokenone
  |2 -> if x > 75 then begin ajoute_pokenone pokenone 2 y' ;screen := 3 ; key_pressed:=1 end else capture_echoue pokenone
  |3 -> if x > 85 then begin ajoute_pokenone pokenone 2 y' ;screen := 3 ; key_pressed:=1 end else capture_echoue pokenone
  |4 -> if x > 92 then begin ajoute_pokenone pokenone 2 y' ;screen := 3 ; key_pressed:=1 end else capture_echoue pokenone
  |5-> if x >= 98 then begin ajoute_pokenone pokenone 2 y' ;screen := 3 ; key_pressed:=1 end else capture_echoue pokenone
  |_-> failwith "rarete inconnu"
  

let loop_combat sauvage n x' y' = 
  let open Raylib in
  let sort_joueur = ref(!equipe_actuelle.(0).sort1) in
  let sort_ia = ref (sauvage.(0).sort1) in
  let x = Raylib.get_random_value 1 2 in
  if sauvage.(0).niveau.valeur >=10 && x = 2 then sort_ia := sauvage.(0).sort2 ;
  if !equipe_actuelle.(0).niveau.valeur >=10 then sort_joueur := n ;
  if !equipe_actuelle.(0).vitesse > sauvage.(0).vitesse then begin 
                                                              sauvage.(0).pv <- sauvage.(0).pv - !sort_joueur.degat ;
                                                              if sauvage.(0).pv <=0 then ()
                                                              else !equipe_actuelle.(0).pv <- !equipe_actuelle.(0).pv - !sort_ia.degat ; 
                                                              end
  else begin
        !equipe_actuelle.(0).pv <- !equipe_actuelle.(0).pv - !sort_ia.degat ;
        draw_text (string_of_int(!equipe_actuelle.(0).pv)^" / "^string_of_int(point_de_vie_max !equipe_actuelle.(0))) 130 (y'+1) 20 Color.black ;
        if !equipe_actuelle.(0).pv <=0 then Raylib.draw_text "Mort"  x' (y'-20) 30 Raylib.Color.black 
        else sauvage.(0).pv <- sauvage.(0).pv - !sort_joueur.degat ; 
        draw_text (string_of_int(sauvage.(0).pv)^" / "^string_of_int(point_de_vie_max sauvage.(0))) 600 (y'+1) 20 Color.black ;
        end                                                            



let  pressed_combat sauvage x y'  =
  let open Raylib in
if !screen = 0 then begin
  let pressed = ref 0 in
  if sauvage.(0).pv <= 0 then pressed:= 0;
  if !equipe_actuelle.(0).pv <= 0 then pressed :=5  ;
  if is_key_pressed Key.One then pressed := 1 ;
  if is_key_pressed Key.Two then pressed := 2 ;
  if is_key_pressed Key.R then pressed :=3 ; 
  if is_key_pressed E then pressed := 4 ;
    match !pressed with 
    |1 -> loop_combat sauvage !equipe_actuelle.(0).sort1 x y' 
    |2 -> loop_combat sauvage !equipe_actuelle.(0).sort2 x y'
    |3 -> capture sauvage.(0) y'
    |_ -> ()
end


let combat_ui sauvage l_texture n zone camera =
let open Raylib in
if !screen = 0 then timer := get_time ()  ;
if is_any_key_pressed () || get_time () > !timer +.1.  then screen:= 0 ;
let w_menu = 170. in
let h_menu = 62. in
let x = 332. in
let y = ref(Vector2.y(Camera2D.target camera)-.250.) in
let y'= int_of_float(!y+.315.) in
let menu_pokeball  = Rectangle.create x (float_of_int(y')) w_menu h_menu in
let menu_equipe  = Rectangle.create x (float_of_int(y')+.h_menu) w_menu h_menu in
let menu_fuite  = Rectangle.create x (float_of_int(y')+.2.*.h_menu) w_menu  h_menu in
if !screen >0 then draw_text "Capture " 350 (y'-80) 30 Color.black ;  
if !screen >0 then draw_text ("echoue ") 350 (y'-50) 30 Color.black ;  
draw_pokenone l_texture n 0 !equipe_actuelle zone camera 0. ;
draw_pokenone l_texture n 0 sauvage zone camera 500. ;
draw_hpbar 29 y' 305 20 !equipe_actuelle.(0) ;
draw_hpbar 530 y' 305 20 sauvage.(0) ;
if !equipe_actuelle.(0).pv <= 0 then draw_text (string_of_int(0)^" / "^string_of_int(point_de_vie_max !equipe_actuelle.(0))) 130 (y'+1) 20 Color.black 
else draw_text (string_of_int(!equipe_actuelle.(0).pv)^" / "^string_of_int(point_de_vie_max !equipe_actuelle.(0))) 130 (y'+1) 20 Color.black  ;
if sauvage.(0).pv <= 0 then draw_text (string_of_int(0)^" / "^string_of_int(point_de_vie_max sauvage.(0))) 600 (y'+1) 20 Color.black 
else draw_text (string_of_int(sauvage.(0).pv)^" / "^string_of_int(point_de_vie_max sauvage.(0))) 600 (y'+1) 20 Color.black  ;
draw_rectangle_rec menu_pokeball Color.red ; draw_rectangle_lines_ex menu_pokeball 3. Color.black ; draw_text "Equipe : E" (int_of_float((x+.10.))) (y'+20) 30 Color.black ;
draw_rectangle_rec menu_equipe Color.red ; draw_rectangle_lines_ex menu_equipe 3. Color.black ;  draw_text "Capturer : R " (int_of_float((x+.10.))) (y'+20+(int_of_float(h_menu))) 24 Color.black ;
draw_rectangle_rec menu_fuite Color.red ;draw_rectangle_lines_ex menu_fuite 3. Color.black ;  draw_text "Fuite : Space " (int_of_float((x+.10.))) (y'+20+2*(int_of_float(h_menu))) 24 Color.black ;
if !screen =0 then begin draw_text "Capacité 1 " (int_of_float((x+.10.))) (y'-300) 30 Color.black ; draw_text "1" (int_of_float((x+.80.))) (y'-250) 30 Color.black ;
 draw_text "Capacité 2 " (int_of_float((x+.10.))) (y'-200) 30 Color.black ; draw_text "2" (int_of_float((x+.80.))) (y'-150) 30 Color.black end ;
pressed_combat sauvage (int_of_float x) y' 




let rec test_collision l point_player = 
  match l with 
  |[] -> false,rec_herbe
  |t::_ when Raylib.check_collision_point_rec point_player t -> true,t
  |_::q -> test_collision q point_player


 let combat point_player  l_texture n zone camera mouvement =
 let open Raylib in
 let terrain = List.nth l_combat_collision 0 in
 let test = check_collision_point_rec point_player terrain in
 if !proc <> 3 && mouvement then proc := get_random_value 0 100 ;
 if is_key_pressed Key.Space then key_pressed := !key_pressed +1 ;
 match !proc,test,!key_pressed,zone with
 |_,_,_,0 -> true
 |_,false,_,_ -> true
 |_,_,1,_ -> key_pressed := 0 ;proc:=0 ;sauvage.(0) <- spawn_sauvage terrain zone l_combat_collision  ; true
 |3,true,_,_ -> combat_ui sauvage l_texture n zone camera ; false
 |_  -> true


