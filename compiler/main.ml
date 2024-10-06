open Lexer

let () =
  let input = "if (x > 0.01 + 0.02) { return 1; } else { return 0; }" in
  let tokens = lexer input 0 in
  Printf.printf "- : token list =\n[";
  List.iteri (fun i token ->
    if i > 0 then Printf.printf "; ";
    Printf.printf "%s" (match token with
      | If -> "If"
      | Else -> "Else"
      | LParan -> "LParan"
      | RParan -> "RParan"
      | LCurlyBracket -> "LCurlyBracket"
      | RCurlyBracket -> "RCurlyBracket"
      | Return -> "Return"
      | Semicolon -> "Semicolon"
      | Number n -> Printf.sprintf "Number(%g)" n
      | Identifier s -> Printf.sprintf "Identifier(%s)" s
      | EOF -> "EOF"
      | Plus -> "Plus"
      | _ -> "Other"
    )
  ) tokens;
  Printf.printf "]\n"