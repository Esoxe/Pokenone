let zone = ref 0
let y  = ref 162.
let x = ref 138.
let wplayer = 20.
let hplayer = 36.  
let mouvement = ref false


let rec rectangle_check checker rec_player l_decor_collision =
  let open Raylib in
  match l_decor_collision with
  |[] -> !checker
  |t::q -> checker := not(check_collision_recs rec_player t) ; if !checker = false then !checker
                                                               else rectangle_check checker rec_player q 

let collision_checker x y l_texture n camera = 
  let rec_player =Raylib.Rectangle.create (x+.5.) (y+.2.) wplayer hplayer in
  let checker =  ref true in
  if !zone = 0 then 
    Scene.check_collision_ball checker rec_player l_texture n !zone camera ;
    checker := rectangle_check checker rec_player Scene.l_decor_collision ;
    !checker


let camera_gestion camera =
  let open Raylib in
  if !zone>0 && !y<270. then Camera2D.set_target camera (Vector2.create (400.)(!y-.20.)) 

let zone_manager () = 
let open Raylib in 
  let checker = ref true in
  let rec_player =Rectangle.create (!x+.5.) (!y+.2.) wplayer hplayer in
  let test,choix = (Scene.rectangle_check_ball checker rec_player Scene.l_ball_collision) in
  match !zone,test with
    |0,false when is_key_down Key.Enter -> zone := !zone+1 ; Scene.ball_y := 600. ;Interface.e_pressed := 0 ; Scene.y_text := 700 ; Pokenone.ajoute_pokenone Scene.a_starter.(choix) 0 0 ;
    |_,_ -> ()

 let movement l_texture n camera =
  let open Raylib in
  let bord_droite = (!x<800.-.26. && (collision_checker (!x+.2.) !y l_texture n camera)) in
  let bord_gauche = (!x>0. && (collision_checker (!x-.2.) !y l_texture n camera )) in
  let bord_haut =   ((!y>0. || !zone>0) && (collision_checker !x (!y-.2.) l_texture n camera)) in
  let bord_bas =    (!y<500.-.36. && (collision_checker !x (!y+.2.) l_texture n camera ))  in

  match bord_droite , bord_gauche , bord_haut , bord_bas with
  |_,_,true,_ when is_key_down Key.W -> y:= !y -. 2. ; mouvement := true
  |_,_,_,true when is_key_down Key.S -> y:= !y +. 2. ; mouvement := true
  |_,true,_,_ when is_key_down Key.A -> x:= !x -. 2. ; mouvement := true
  |true,_,_,_ when is_key_down Key.D -> x:= !x +. 2. ; mouvement := true
  |_ -> x:= !x +. 0.;  mouvement := false
    
    
let rendu l_texture n camera =
  let point_player = Raylib.Vector2.create !x !y in
  Raylib.draw_pixel_v point_player Raylib.Color.black ;
  let open Raylib in 
  zone_manager () ;
  Scene.draw_scene l_texture !zone camera  ;
  draw_texture (List.nth l_texture 0) (Int.of_float(!x)) (Int.of_float(!y)) Color.white ;
  let test = (Interface.equipe camera !zone l_texture n) && (Pokenone.combat point_player  l_texture n !zone camera !mouvement)  in
  camera_gestion camera ;
  if test then movement l_texture n camera  ;
  