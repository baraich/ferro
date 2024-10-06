(lang dune 3.16)

(name compiler)

(generate_opam_files true)

(source
 (github baraich/ferro))

(authors "Gurvir Singh <gurvirsingh.baraich@gmail.com>")

(maintainers "Gurvir Singh")

(license MIT)

(package
 (name compiler)
 (synopsis
  "Ferro: A systems programming language merging Rust's safety with Go's simplicity.")
 (description
  "Ferro combines memory safety and concurrency, leveraging Rust’s type system and Go’s syntax. Designed for high-performance applications, Ferro enables efficient, safe code while boosting developer productivity. Join the Ferro community to influence its evolution.\n\n\n\n")
 (depends ocaml dune)
 (tags
  (topics "systems programming" "memory safety" "concurrency")))
