# Glue buildfile that "pulls" all the packages in the project.
#
import pkgs = [dir_paths] $process.run_regex(\
  cat $src_root/packages.manifest, '\s*location\s*:\s*(\S+)\s*', '\1')

./: $pkgs


define run: alias

run{setup-clang}:
{{
  diag roguey-setup-clang $>
  bdep init -C builds/clang @clang cc config.cxx=clang++
}}

run{nuke}:
{{
  rm -rf builds/ .bdep/ install/
}}


run{install}: run{setup-clang}
{{
  diag roguey-install $>
  $build.path install: $src_root/roguey/ "config.install.root=$src_root/install" config.install.relocatable=true
#   ln -s ./install/bin/roguey ./run-roguey
}}
