# Demo Esy Docker Image

Uses BuildKit to raise `EXDEV` during build.

Run with

```bash
DOCKER_BUILDKIT=1 docker build -t ded .
```

Output should contain something like

```
#15 0.207 info install 0.6.6 (using package.json)
#15 0.319 info checking https://github.com/ocaml/opam-repository for updates...
#15 1.369 info checking https://github.com/esy-ocaml/esy-opam-override for updates...
#15 4.318 esy: internal error, uncaught exception:
#15 4.318      Unix.Unix_error(Unix.EXDEV, "rename", "/root/package/_esy/default/tmp/esy-f9ed49")
#15 4.318      Raised at file "esy-lib/RunAsync.re", line 13, characters 2-51
#15 4.318      Re-raised at file "esy-lib/RunAsync.re", line 13, characters 2-51
#15 4.318      Re-raised at file "src/core/lwt.ml", line 2999, characters 20-29
#15 4.318      Called from file "src/unix/lwt_main.ml", line 26, characters 8-18
#15 4.318      Called from file "esy-lib/Cli.re", line 264, characters 9-28
#15 4.318      Called from file "cmdliner_term.ml", line 25, characters 19-24
#15 4.318      Called from file "cmdliner.ml", line 25, characters 27-34
#15 4.318      Called from file "cmdliner.ml", line 116, characters 32-39
```