(*Definition des largeur et position des élements*)
let ball_3_x = ref 550.
let ball_y = ref 250.
let ball_1_x = ref 350. 
let ball_2_x = ref 450.
let w = 80.
let h = 80.
let center = 16.
let wmaison =160.
let hmaison = 100. 
let a_starter =   [|Pokenone.pokedex.(1);Pokenone.pokedex.(2);Pokenone.pokedex.(3)|]
let y_text = ref 320

(*Definition des rectangle de collision lié a chaque element *)

let rec_ball_1 = Raylib.Rectangle.create (!ball_1_x-.center) (!ball_y-.center) w h 
let rec_ball_2 = Raylib.Rectangle.create (!ball_2_x-.center) (!ball_y-.center) w h 
let rec_ball_3 = Raylib.Rectangle.create (!ball_3_x-.center) (!ball_y-.center) w h 
let rec_maison_haut = Raylib.Rectangle.create 60. 64. wmaison hmaison
let rec_maison_bas =  Raylib.Rectangle.create 600. 366. wmaison hmaison
let rec_arbre = Raylib.Rectangle.create  592. 105. 43. 100.
let rec_fontaine = Raylib.Rectangle.create 85. 380. 58. 40.
let l_decor_collision = [rec_maison_haut;rec_maison_bas;rec_arbre;rec_fontaine] 
let l_ball_collision  = [rec_ball_1;rec_ball_2;rec_ball_3]


(*verification sur le starter est unique*)
let starter_unique starter   =
let test = ref true in
for i = 0 to Array.length a_starter -1 do
  if a_starter.(i).Pokenone.numero_pokedex = starter.Pokenone.numero_pokedex then  test := false
 done;
 !test


let create_starter a y zone =
  let i = ref 0 in
  while !i <=2 do
    let starter = Pokenone.random_pokemon a 0 y zone false in
    if !i > 0 && not(starter_unique starter ) then i:=!i-1 
      else a_starter.(!i) <- starter  ;
    i:=!i+1
  done 

  let remplissage_herbe l_texture =
    let x = ref 0 in
    let y = ref 0 in
    while !y >(-1000) do
      while !x+40 < 800 do 
      Raylib.draw_texture (List.nth l_texture 6) !x !y Raylib.Color.white;
       x:= !x+30 
      done ;
       x := 0 ;
       y:= !y-25 ;
   done 


(*Chargement de tous les elements*)
let draw_scene l_texture zone camera =
  let open Raylib in 
  let y = ref(Vector2.y(Camera2D.target camera)-.250.) in
    clear_background Color.darkgreen ;
    draw_texture (List.nth l_texture 2 ) 5 0 Color.white  ;
    draw_texture (List.nth l_texture 3 )  500 0 Color.white ;
    draw_texture (List.nth l_texture 2 ) 550 300 Color.white ;
    draw_texture (List.nth l_texture 1 ) (Int.of_float (!ball_1_x)) (Int.of_float (!ball_y)) Color.white ;
    draw_texture (List.nth l_texture 1 ) (Int.of_float (!ball_2_x)) (Int.of_float (!ball_y)) Color.white ;
    draw_texture (List.nth l_texture 1 ) (Int.of_float (!ball_3_x)) (Int.of_float (!ball_y)) Color.white ;
    draw_rectangle_rec Pokenone.rec_herbe Color.black ;
    draw_texture (List.nth l_texture 4 ) 60 350 Color.white ;
    draw_text "Choissisez votre 1er Pokenone " 346 !y_text 29 Color.black ;
    remplissage_herbe l_texture ;
    if zone > 0 then draw_text "E : Equipe " 650 (int_of_float(!y)) 30 Color.black 

                   

let rec rectangle_check_ball checker rec_player l_ball_collision  =
  let open Raylib in
  match l_ball_collision with
  |[] -> (!checker,3)
  |t::q -> checker := not(check_collision_recs rec_player t) ; if !checker = false then (!checker,List.length q)
                                                               else rectangle_check_ball checker rec_player q 
    
    
let check_collision_ball checker rec_player l_texture n zone camera =      
  let checker_ball,ball = rectangle_check_ball checker rec_player l_ball_collision in 
  match checker_ball,ball with 
  |true,_ -> Pokenone.draw_pokenone l_texture n ball a_starter  zone camera 0.
  |_,2 -> Pokenone.draw_pokenone l_texture n ball a_starter zone camera 0.
  |_,1 -> Pokenone.draw_pokenone l_texture n ball a_starter zone camera 0.
  |_,0 -> Pokenone.draw_pokenone l_texture n ball a_starter zone camera 0. 
  |_,_ -> Pokenone.draw_pokenone l_texture n ball a_starter zone camera 0.
