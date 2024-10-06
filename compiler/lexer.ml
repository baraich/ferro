type token =
(* Keywords *)
| If
| Else
| For
| While
| Return

(* Identifiers *)
| Number of float
| Identifier of string

(* Operators *)
| Plus
| Minus
| Multiply
| Divide
| Mod
| Equal
| Ampercent
| Bang
| Dot

(* Punctuation *)
| Semicolon
| Comma
| LParan
| RParan
| LBracket
| RBracket
| LCurlyBracket
| RCurlyBracket

(* EOF *)
| EOF



(* Lexer Implemention *)
let lexer (input: string) (position: int) =
  let rec lexer_ (position: int) = 
    if position >= String.length input then [EOF]
    else match input.[position] with
    (* Ignore Whitespace *)
    | ' ' | '\n' | '\t' -> lexer_ (position + 1)

    (* Parse Puncuation *)
    | '(' -> LParan :: lexer_ (position + 1) 
    | ')' -> RParan :: lexer_ (position + 1)
    | '[' -> LBracket :: lexer_ (position + 1)
    | ']' -> RBracket :: lexer_ (position + 1)
    | '{' -> LCurlyBracket :: lexer_ (position + 1)
    | '}' -> RCurlyBracket:: lexer_ (position + 1)
    | ',' -> Comma :: lexer_ (position + 1)
    | ';' -> Semicolon :: lexer_ (position + 1)

    (* Parse Opreators *)
    | '+' -> Plus :: lexer_ (position + 1)
    | '-' -> Minus :: lexer_ (position + 1)
    | '*' -> Multiply :: lexer_ (position + 1)
    | '/' -> Divide :: lexer_ (position + 1)
    | '%' -> Mod :: lexer_ (position + 1)
    | '=' -> Equal :: lexer_ (position + 1)
    | '&' -> Ampercent :: lexer_ (position + 1)
    | '!' -> Bang :: lexer_ (position + 1)
    | '.' -> Dot :: lexer_ (position + 1)

    (* Parse Float *)
    | '0'..'9' as c -> 
      let rec read_number (acc: string) (position: int) = 
        if position < String.length input
          then match input.[position] with
            | '0'..'9' | '.' -> read_number (acc ^ (String.make 1 input.[position])) (position + 1)
            | _ -> (Number (float_of_string acc), position)
        else (Number (float_of_string acc), position)
      in
      let (number, new_position) = read_number (String.make 1 c) (position + 1) in
      number :: lexer_ new_position

    (* Parse Identifiers *)
    | 'a'..'z' | 'A'..'Z' as c -> 
      let rec read_identifier (acc: string) (position: int) =
        if position < String.length input
          then match input.[position] with
            | 'a'..'z' | 'A'..'Z' | '0'..'9' | '_' -> read_identifier (acc ^ (String.make 1 input.[position])) (position + 1)
            | _ -> (Identifier acc, position)
        else (Identifier acc, position)
      in 
      let (identifier, new_position) = read_identifier (String.make 1 c) (position + 1) in
      identifier :: lexer_ new_position

    | _ -> lexer_ (position + 1)
    (* | _ -> failwith "Fatal: Invalid character!" *)
  in lexer_ position
