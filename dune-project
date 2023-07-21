(lang dune 3.4)

(name cs_ocaml)

(generate_opam_files true)

(package
 (name cs_ocaml)
 (synopsis "Computer Science")
 (description "Comuter Science with Ocaml")
 (allow_empty)
 (depends
  (ocaml
   (>= 4.07.0))
  (alcotest :with-test)
  dune))
