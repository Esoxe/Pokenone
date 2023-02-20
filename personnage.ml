let y  = ref 162
let x = ref 138
let zone = 0 
let wplayer = 20.
let hplayer = 36.    

let rec rectangle_check checker rec_player l_decor_collision =
  let open Raylib in
  match l_decor_collision with
  |[] -> !checker
  |t::q -> checker := not(check_collision_recs rec_player t) ; if !checker = false then !checker
                                                               else rectangle_check checker rec_player q 

let collision_checker x y l_texture n = 
  let checker =  ref true in
  let open Raylib in 
  let rec_player = Rectangle.create (Float.of_int (x+5)) (Float.of_int (y+2)) wplayer hplayer in 
  if zone = 0 then 
    Scene0.check_collision_ball checker rec_player l_texture n ;
    checker := rectangle_check checker rec_player Scene0.l_decor_collision ;
    !checker

let movement l_texture  n =
  let open Raylib in 
  draw_texture (List.nth l_texture 0) !x !y Color.white ;
  draw_text (string_of_int(get_fps())) 780 20 5 Color.black ;
  draw_text (string_of_int !x) 740 20 5 Color.black ;
  draw_text (string_of_int !y) 760 20 5 Color.black ;
  let bord_droite = !x<800-26 && (collision_checker (!x+2) !y l_texture n) in
  let bord_gauche = !x>0 && (collision_checker (!x-2) !y l_texture n) in
  let bord_haut =   !y>0 && (collision_checker !x (!y-2) l_texture n) in
  let bord_bas =    !y<500-36 && (collision_checker !x (!y+2)l_texture n)  in

  match bord_droite , bord_gauche , bord_haut , bord_bas with
  |_,_,true,_ when is_key_down Key.W -> y:= !y - 2 
  |_,_,_,true when is_key_down Key.S -> y:= !y + 2 
  |_,true,_,_ when is_key_down Key.A -> x:= !x - 2 
  |true,_,_,_ when is_key_down Key.D -> x:= !x + 2 
  |_ -> x:= !x + 0 


