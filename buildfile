# Glue buildfile that "pulls" all the packages in the project.
#
import pkgs = [dir_paths] $process.run_regex(\
  cat $src_root/packages.manifest, '\s*location\s*:\s*(\S+)\s*', '\1')

./: $pkgs


define run: alias

install_options = "config.install.root=$src_root/install" config.install.relocatable=true

run{init-clang}:
{{
  diag roguey-setup-clang $>
  bdep init -C builds/clang @clang cc config.cxx=clang++ $install_options
}}

run{init-gcc}:
{{
  diag roguey-setup-clang $>
  bdep init -C builds/gcc @gcc cc config.cxx=g++ $install_options
}}

run{nuke}:
{{
  rm -rf builds/ .bdep/ install/
}}

