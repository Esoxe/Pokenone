(*Definition des largeur et position des élements*)
let ball_1_x = 250.
let ball_y = 250.
let ball_2_x = 350. 
let ball_3_x = 450.
let w = 80.
let h = 80.
let center = 16.
let wmaison =160.
let hmaison = 100. 
let a_starter = [||]

(*Definition des rectangle de collision lié a chaque element *)

let rec_ball_1 = Raylib.Rectangle.create (ball_1_x-.center) (ball_y-.center) w h 
let rec_ball_2 = Raylib.Rectangle.create (ball_2_x-.center) (ball_y-.center) w h 
let rec_ball_3 = Raylib.Rectangle.create (ball_3_x-.center) (ball_y-.center) w h 
let rec_maison_haut = Raylib.Rectangle.create 60. 64. wmaison hmaison
let rec_maison_bas =  Raylib.Rectangle.create 600. 366. wmaison hmaison
let rec_arbre = Raylib.Rectangle.create  592. 105. 43. 100.
let rec_fontaine = Raylib.Rectangle.create 85. 380. 58. 40.
let l_decor_collision = [rec_maison_haut;rec_maison_bas;rec_arbre;rec_fontaine] 
let l_ball_collision  = [rec_ball_1;rec_ball_2;rec_ball_3]



(*verifie si le starter est unique*)
let parcours_starter starter =
  let test = ref true in
  for i = 0 to Array.length a_starter - 1 do
    if a_starter.(i) = starter then test := false
    done ;
  !test
  

(*randomisation des starter*)
let rec random_pokemon  () =
  let x = Random.int (Array.length Pokenone.pokedex ) in
  let starter = Pokenone.pokedex.(x) in
  if starter.element = Pokenone.Nucleaire || parcours_starter starter then random_pokemon ()
  else starter.sort1 <- Pokenone.capacite_aleatoire starter.element ;
                         starter.attaque <- Pokenone.stats_starter starter ;
                         starter.defense <- Pokenone.stats_starter starter ;
                         starter.vitesse  <- Pokenone.stats_starter starter
  

let starter = Array.make 3 random_pokemon 

let rec rectangle_check_ball checker rec_player l_ball_collision =
  let open Raylib in
  match l_ball_collision with
  |[] -> (!checker,-1)
  |t::q -> checker := not(check_collision_recs rec_player t) ; if !checker = false then (!checker,List.length q)
                                                               else rectangle_check_ball checker rec_player q 


let check_collision_ball checker rec_player l_texture =
  let open Raylib in
  let checker_ball,ball = rectangle_check_ball checker rec_player l_ball_collision in 
  match checker_ball,ball with 
  |true,_ -> ()
  |_,2 ->draw_texture (List.nth l_texture 4) 0 0 Color.white
  |_,1 ->draw_texture (List.nth l_texture 4) 0 0 Color.white
  |_,0 ->draw_texture (List.nth l_texture 4) 0 0 Color.white
  |_,_ -> ()

(*Chargement de tous les elements*)
let draw_scene0 l_texture=
  let open Raylib in 
    clear_background Color.darkgreen ;
    draw_texture (List.nth l_texture 2 ) 5 0 Color.white  ;
    draw_texture (List.nth l_texture 3 )  500 0 Color.white ;
    draw_texture (List.nth l_texture 2 ) 550 300 Color.white ;
    draw_texture (List.nth l_texture 1 ) (Int.of_float (ball_1_x)) (Int.of_float (ball_y)) Color.white ;
    draw_texture (List.nth l_texture 1 ) (Int.of_float (ball_2_x)) (Int.of_float (ball_y)) Color.white ;
    draw_texture (List.nth l_texture 1 ) (Int.of_float (ball_3_x)) (Int.of_float (ball_y)) Color.white ;
    draw_texture (List.nth l_texture 4 ) 60 350 Color.white ;
    draw_rectangle_lines_ex rec_ball_1 5.0 Color.black ;
    draw_rectangle_lines_ex rec_ball_2 5.0 Color.black ;
    draw_rectangle_lines_ex rec_ball_3 5.0 Color.black  

