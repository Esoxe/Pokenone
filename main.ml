let setup () =
  let open Raylib in
  init_window 800 500 "Valbonne";
  let player = load_texture "image/sasha.png" in
  let ball = load_texture "image/pokenone.png" in
  let maison = load_texture "image/maisonori.png" in 
  let arbre = load_texture "image/arbre.png" in
  let fontaine = load_texture "image/fontaine.png" in
  let error = load_texture "image/eror.png" in
  let l_texture = [player;ball;maison;arbre;fontaine;error] in 
  set_target_fps 60 ;
  l_texture


let rec loop l_texture =
  if Raylib.window_should_close () then Raylib.close_window ()
  else 
      Raylib.begin_drawing () ;
      if Personnage.zone = 0 then
        Scene0.draw_scene0 l_texture ;
      Personnage.movement l_texture ;
      Raylib.end_drawing () ;
      loop l_texture

let () = loop (setup())