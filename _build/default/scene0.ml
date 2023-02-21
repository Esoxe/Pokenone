(*Definition des largeur et position des élements*)
let ball_1_x = 550.
let ball_y = 250.
let ball_2_x = 350. 
let ball_3_x = 450.
let w = 80.
let h = 80.
let center = 16.
let wmaison =160.
let hmaison = 100. 
let a_starter =   [|Pokenone.pokedex.(1);Pokenone.pokedex.(2);Pokenone.pokedex.(3)|]
let h_rectangle_page = 40.
let w_rectangle_page = 334.

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


(*verification sur le starter est unique*)
let starter_unique starter =
let test = ref true in
for i = 0 to Array.length a_starter -1 do
  if a_starter.(i).Pokenone.numero_pokedex = starter.Pokenone.numero_pokedex then  test := false
 done;
 !test


(*randomisation des starter*)
let rec random_pokemon () =
  Random.self_init () ;
  let x = Random.int (Array.length Pokenone.pokedex ) in
  let starter = Pokenone.pokedex.(x) in
  match starter.element with 
  |Nucleaire -> random_pokemon ()
  |_ -> starter.sort1 <- Pokenone.capacite_aleatoire starter.element ; 
              starter.attaque <- Pokenone.stat_aleatoire starter ;
              starter.defense <- Pokenone.stat_aleatoire starter ;
              starter.vitesse <- Pokenone.stat_aleatoire starter ;
              starter


let create_starter =
  let i = ref 0 in
  while !i <=2 do
    let starter = random_pokemon () in
    if !i > 0 && not(starter_unique starter) then i:=!i-1 
      else a_starter.(!i) <- starter  ;
    i:=!i+1
  done 


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

let setup_rectangle_page x y w h line_thic =
let open Raylib in
  let rec_niveau = Rectangle.create x y w h in
  let rec_attaque = Rectangle.create x (y+.h) w h in
  let rec_defense = Rectangle.create x (y+.2.*.h) w h in
  let rec_vitesse = Rectangle.create x (y+.3.*.h) w h in
  draw_rectangle_rec rec_niveau Color.lightgray ;draw_rectangle_lines_ex rec_niveau line_thic Color.black ;
  draw_rectangle_rec rec_attaque Color.lightgray ;draw_rectangle_lines_ex rec_attaque line_thic Color.black ;
  draw_rectangle_rec rec_defense Color.lightgray ;draw_rectangle_lines_ex rec_defense line_thic Color.black ;
  draw_rectangle_rec rec_vitesse Color.lightgray ;draw_rectangle_lines_ex rec_vitesse line_thic Color.black 
  


    let draw_starter l_texture n ball a =
  let open Raylib in
  if ball < 3 then begin draw_texture (List.nth l_texture (n+a.(ball).Pokenone.numero_pokedex)) 0 0 Color.white ; 
                   setup_rectangle_page 0. w_rectangle_page w_rectangle_page h_rectangle_page 5.
                   end


let rec rectangle_check_ball checker rec_player l_ball_collision =
  let open Raylib in
  match l_ball_collision with
  |[] -> (!checker,3)
  |t::q -> checker := not(check_collision_recs rec_player t) ; if !checker = false then (!checker,List.length q)
                                                               else rectangle_check_ball checker rec_player q 
    
    
let check_collision_ball checker rec_player l_texture n =      
  let checker_ball,ball = rectangle_check_ball checker rec_player l_ball_collision in 
  match checker_ball,ball with 
  |true,_ -> draw_starter l_texture n ball a_starter
  |_,2 -> draw_starter l_texture n ball a_starter
  |_,1 -> draw_starter l_texture n ball a_starter
  |_,0 -> draw_starter l_texture n ball a_starter
  |_,_ -> draw_starter l_texture n ball a_starter