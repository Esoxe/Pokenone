let screenW = 800
let screenH = 500

(*renvoie le premier indice d'un texture étant un pokenone*)
let rec nb_texture l pokenone =
  match l with 
  |[] -> 0
  |t::_ when t=pokenone -> -1
  |_::q -> 1 + nb_texture q pokenone

let setup () =
  let open Raylib in
  init_window screenW screenH "Valbonne" ;
  set_target_fps 60 ; 
  let player = load_texture "image/sasha.png" in let ball = load_texture "image/pokenone.png" in let maison = load_texture "image/maisonori.png" in let arbre = load_texture "image/arbre.png" in let fontaine = load_texture "image/fontaine.png" in let arrow = load_texture "image/arrow.png" in let herbe = load_texture "image/herbe.png" in let dead = load_texture "image/dead.png" in
  let pokenone1_texture = load_texture "pokedex/pokenone sombre/Quirkoko.png" in let pokenone2_texture = load_texture "pokedex/pokenone magie/Lampika.png" in let pokenone3_texture = load_texture "pokedex/pokenone dragon/cragon.png" in let pokenone4_texture = load_texture "pokedex/pokenone eau/Bellenobi.png" in let pokenone5_texture = load_texture "pokedex/pokenone bagarre/Atlascar.png" in let pokenone6_texture = load_texture "pokedex/pokenone air/Prankatoo.png" in let pokenone7_texture = load_texture "pokedex/pokenone terre/Wreckoon.png" in let pokenone8_texture = load_texture "pokedex/pokenone nature/Chopetal.png" in let pokenone9_texture = load_texture "pokedex/pokenone nature/Anticoot.png" in let pokenone10_texture = load_texture "pokedex/pokenone nucleaire/Commodeen.png" in 
  let pokenone11_texture = load_texture "pokedex/pokenone air/Driftangle.png" in let pokenone12_texture = load_texture "pokedex/pokenone air/Ponditz.png" in let pokenone13_texture = load_texture "pokedex/pokenone terre/Gustick.png" in let pokenone14_texture = load_texture "pokedex/pokenone bagarre/Cursqueak.png" in let pokenone15_texture = load_texture "pokedex/pokenone air/Pigale.png" in let pokenone16_texture = load_texture "pokedex/pokenone nature/Serpenatee.png" in let pokenone17_texture = load_texture "pokedex/pokenone terre/Germith.png" in let pokenone18_texture = load_texture "pokedex/pokenone sombre/Stormew.png" in let pokenone19_texture = load_texture "pokedex/pokenone magie/Torrentrash.png" in let pokenone20_texture = load_texture "pokedex/pokenone bagarre/Scorprickle.png" in
  let pokenone21_texture = load_texture "pokedex/pokenone magie/Glisdisc.png" in let pokenone22_texture = load_texture "pokedex/pokenone terre/Golemidge.png" in let pokenone23_texture = load_texture "pokedex/pokenone bagarre/Elekick.png" in let pokenone24_texture = load_texture "pokedex/pokenone feu/Twigrouse.png" in let pokenone25_texture = load_texture "pokedex/pokenone feu/Bantamal.png" in let pokenone26_texture = load_texture "pokedex/pokenone nature/Duradiva.png" in let pokenone27_texture = load_texture "pokedex/pokenone dragon/Septicoral.png" in let pokenone28_texture = load_texture "pokedex/pokenone sombre/Venopal.png" in let pokenone29_texture = load_texture "pokedex/pokenone dragon/Nihilith.png" in let pokenone30_texture = load_texture "pokedex/pokenone dragon/Nemarius.png" in
  let pokenone31_texture = load_texture "pokedex/pokenone bagarre/Dumpion.png" in let pokenone32_texture = load_texture "pokedex/pokenone magie/Bahamew.png" in let pokenone33_texture = load_texture "pokedex/pokenone eau/Floofrog.png" in let pokenone34_texture = load_texture "pokedex/pokenone feu/vulturing.png" in let pokenone35_texture = load_texture "pokedex/pokenone nucleaire/Featherey.png" in let pokenone36_texture = load_texture "pokedex/pokenone nature/Emperosa.png" in let pokenone37_texture = load_texture "pokedex/pokenone eau/Primare.png" in let pokenone38_texture = load_texture "pokedex/pokenone terre/Seasonoir.png" in let pokenone39_texture = load_texture "pokedex/pokenone dragon/Dryadoll.png" in let pokenone40_texture = load_texture "pokedex/pokenone feu/gladiufus.png" in
  let pokenone41_texture = load_texture "pokedex/pokenone sombre/Aresage.png" in let pokenone42_texture = load_texture "pokedex/pokenone nucleaire/Minimurai.png" in let pokenone43_texture = load_texture "pokedex/pokenone terre/Gongenta.png" in let pokenone44_texture = load_texture "pokedex/pokenone air/Zigzagoat.png" in let pokenone45_texture = load_texture "pokedex/pokenone nucleaire/Maximagnus.png" in let pokenone46_texture = load_texture "pokedex/pokenone nucleaire/Robberai.png" in let pokenone47_texture = load_texture "pokedex/pokenone sombre/Sprintugu.png" in let pokenone48_texture = load_texture "pokedex/pokenone eau/Crushark.png" in let pokenone49_texture = load_texture "pokedex/pokenone nucleaire/Elegander.png" in let pokenone50_texture = load_texture "pokedex/pokenone nature/Verdink.png" in
  let pokenone51_texture = load_texture "pokedex/pokenone air/Birdusa.png" in let pokenone52_texture = load_texture "pokedex/pokenone bagarre/Avataur.png" in let pokenone53_texture = load_texture "pokedex/pokenone magie/Aranarl.png" in let pokenone54_texture = load_texture "pokedex/pokenone sombre/Sweetox.png" in let pokenone55_texture = load_texture "pokedex/pokenone eau/Macroops.png" in let pokenone56_texture = load_texture "pokedex/pokenone feu/Salamonk.png" in let pokenone57_texture = load_texture "pokedex/pokenone feu/Precipox.png" in let pokenone58_texture = load_texture "pokedex/pokenone eau/Panichidna.png" in let pokenone59_texture = load_texture "pokedex/pokenone magie/Cursiege.png" in let pokenone60_texture = load_texture "pokedex/pokenone dragon/Tremorosa.png" in
  let l_texture = [player;ball;maison;arbre;fontaine;arrow;herbe;dead;pokenone1_texture;pokenone2_texture;pokenone3_texture;pokenone4_texture;pokenone5_texture;pokenone6_texture;pokenone7_texture;pokenone8_texture;pokenone9_texture;pokenone10_texture;pokenone11_texture;pokenone12_texture;pokenone13_texture;pokenone14_texture;pokenone15_texture;pokenone16_texture;pokenone17_texture;pokenone18_texture;pokenone19_texture;pokenone20_texture;pokenone21_texture;pokenone22_texture;pokenone23_texture;pokenone24_texture;pokenone25_texture;pokenone26_texture;pokenone27_texture;pokenone28_texture;pokenone29_texture;pokenone30_texture;pokenone31_texture;pokenone32_texture;pokenone33_texture;pokenone34_texture;pokenone35_texture;pokenone36_texture;pokenone37_texture;pokenone38_texture;pokenone39_texture;pokenone40_texture;pokenone41_texture;pokenone42_texture;pokenone43_texture;pokenone44_texture;pokenone45_texture;pokenone46_texture;pokenone47_texture;pokenone48_texture;pokenone49_texture;pokenone50_texture;pokenone51_texture;pokenone52_texture;pokenone53_texture;pokenone54_texture;pokenone55_texture;pokenone56_texture;pokenone57_texture;pokenone58_texture;pokenone59_texture;pokenone60_texture] in 
  let n = nb_texture l_texture pokenone1_texture in 
  Scene.create_starter Pokenone.pokedex  (Array.length Pokenone.pokedex-1) (!Personnage.zone) ; Pokenone.initialisation_sauvage_herbe(Array.to_list Pokenone.pokedex) ;Pokenone.initialisation_sauvage_terre () ;Pokenone.initialisation_sauvage_montagne() ; Pokenone.sauvage.(0) <- Pokenone.spawn_sauvage Pokenone.rec_herbe 1 Pokenone.l_combat_collision ; 
  let camera = Camera2D.create (Vector2.create (Float.of_int (screenW/2) ) (Float.of_int (screenH/2) )) (Vector2.create (400.)(250.)) 0.0 1.0 in
  (l_texture,n ,camera )


let rec loop (l_texture,n,camera) =
  if Raylib.window_should_close () then Raylib.close_window ()
  else 
      let open Raylib in
      begin_drawing () ;
      begin_mode_2d camera ;
      Personnage.rendu l_texture n camera ;
      Raylib.end_drawing () ;
      end_mode_2d ();
      loop (l_texture,n,camera)

let () = loop (setup())
