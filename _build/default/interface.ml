let e_pressed = ref 0 
let numero_equipe = ref 0
let select = ref 0 
let select_pokenone = ref 0 

let draw_box_pokemon t =  
  let open Raylib in
  for i=1 to 6 do
    let x = float_of_int(0/i) in
    let box_pokemon = Rectangle.create 334. !t 480. 85. in
    draw_rectangle_rounded box_pokemon 5. 4 Color.gray ;
    draw_rectangle_rounded_lines box_pokemon 5. 4 5. Color.black ;
    t:=!t+.83.+.x
  done

 let draw_dead y l_texture =  
  let open Raylib in
  let box_pokemon = Rectangle.create 334. (float_of_int(y)) 480. 85. in
  draw_rectangle_rounded box_pokemon 5. 4 Color.red;
  draw_rectangle_rounded_lines box_pokemon 5. 4 5. Color.black ;
  draw_texture (List.nth l_texture 7) 700 y Color.white 

let draw_arrow l_texture y = 
    Raylib.draw_texture (List.nth l_texture 5 ) 740 (y+ !numero_equipe*80-40) Raylib.Color.white

let swap_pokemon () =
  if !select = 1 then select_pokenone := !numero_equipe  ;
  if !select = 2 then begin let pokenone = !Pokenone.equipe_actuelle.(!select_pokenone) in 
   !Pokenone.equipe_actuelle.(!select_pokenone) <- !Pokenone.equipe_actuelle.(!numero_equipe) ;
   !Pokenone.equipe_actuelle.(!numero_equipe) <- pokenone ;
    select:= 0;
    select_pokenone :=0 end
  
let rendu_inventaire y camera l_texture n zone =
  let open Raylib in
  if is_key_pressed Key.S then numero_equipe := !numero_equipe +1 
  else if is_key_pressed Key.W then numero_equipe := !numero_equipe -1 ;
  if !numero_equipe > Array.length !Pokenone.equipe_actuelle -1 || !numero_equipe < 0 then numero_equipe := 0 ;
  draw_box_pokemon y ;
  if !select <> 0 then begin swap_pokemon () ; let box_pokemon = Raylib.Rectangle.create 334. (!y-.500.+.(85.*.(float_of_int(!numero_equipe)))) 480. 85. in
  Raylib.draw_rectangle_rounded_lines box_pokemon 5. 4 5. Raylib.Color.red end ;
  if is_key_pressed Key.Enter then select := 1 ;
  if is_key_pressed Key.Enter && !select = 1 then select :=2 ;
  Pokenone.draw_pokenone l_texture n !numero_equipe !Pokenone.equipe_actuelle zone camera 0. ;
  let y' = ref (int_of_float(!y)-450) in
  for i = 0 to Array.length !Pokenone.equipe_actuelle -1 do
    if !Pokenone.equipe_actuelle.(i).pv <= 0 then begin draw_dead (!y'-48) l_texture; draw_text (string_of_int(0)^" / "^string_of_int(Pokenone.point_de_vie_max !Pokenone.equipe_actuelle.(i))) 565 (!y'-25) 20 Color.black end
    else draw_text (string_of_int(!Pokenone.equipe_actuelle.(i).pv)^" / "^string_of_int(Pokenone.point_de_vie_max !Pokenone.equipe_actuelle.(i))) 565 (!y'-25) 20 Color.black  ;
    Pokenone.draw_hpbar 500 !y' 200 20 !Pokenone.equipe_actuelle.(i) ;
    Pokenone.draw_hpbar 29 (!y'+267-(83*i)) 305 20 !Pokenone.equipe_actuelle.(!numero_equipe) ;
    if !Pokenone.equipe_actuelle.(!numero_equipe).pv <=0 then  draw_text (string_of_int(0)^" / "^string_of_int(Pokenone.point_de_vie_max !Pokenone.equipe_actuelle.(!numero_equipe))) 130 (!y'+268-(83*i)) 20 Color.black 
    else  draw_text (string_of_int(!Pokenone.equipe_actuelle.(!numero_equipe).pv)^" / "^string_of_int(Pokenone.point_de_vie_max !Pokenone.equipe_actuelle.(!numero_equipe))) 130 (!y'+268-(83*i)) 20 Color.black ;
    draw_text (!Pokenone.equipe_actuelle.(i).Pokenone.nom) 400 (!y'-30) 20 Color.black ;
    y':= !y' + 83 ;
  done ;
  draw_arrow l_texture (int_of_float(!y)-450)  

    
let equipe camera zone l_texture n = 
  let open Raylib in
  if is_key_pressed Key.E then e_pressed := !e_pressed +1 ;
  let y = ref(Vector2.y(Camera2D.target camera)-.250.) in
  match !e_pressed mod 2 <> 0,zone>0 with
  |true,true -> rendu_inventaire y camera l_texture n zone ;Pokenone.screen :=2; false
  |_ -> numero_equipe := 0 ; true
  