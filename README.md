After entering the Nix devshell, build locally with:

```sh
mkdir tmp
cp -r config tmp/
cp Makefile tmp/
make -C tmp/ init
make -C tmp/
```
