with import <nixpkgs> {};
mkShell {
  buildInputs = with pkgs; [ jdk11 maven ];

  # we need to set M2_HOME to our Maven which uses JDK11
  M2_HOME = pkgs.maven;
  shellHook = ''PS1="\[\e[1;32m\]\u \W> \[\e[0m\]"'';
}
