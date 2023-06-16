open Alcotest
open Report1

module TestKada1 = struct
  open Kadai1

  let test_hello_world () =
    check string "test Hello, World!" "Hello, world!" (hello_world ())
end

let () =
  run "Report1" [
    "Kadai1", [
      test_case "hello_world" `Quick TestKada1.test_hello_world;
    ];
  ]
