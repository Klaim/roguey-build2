# Glue buildfile that "pulls" all the packages in the project.
#
import pkgs = [dir_paths] $process.run_regex(\
  cat $src_root/packages.manifest, '\s*location\s*:\s*(\S+)\s*', '\1')

./: $pkgs


define run: alias

install_options = "config.install.root=$src_root/install" config.install.relocatable=true
other_options = "config.cc.compiledb=./"
config_options = $install_options $other_options


switch $build.host.class
{
  case 'windows'
  {
    config_options += --options-file configs/windows.options
  }

  default
  {
    config_options += --options-file configs/unix.options
  }
}

run{init-clang}:
{{
  diag roguey-setup-clang $>
  bdep init -C builds/clang-debug @clang-debug cc config.cxx=clang++ config.config.load=configs/clang-debug.config $config_options
  bdep init -C builds/clang-release @clang-release cc config.cxx=clang++ config.config.load=configs/clang-release.config $config_options
}}

run{init-gcc}:
{{
  diag roguey-setup-gcc $>
  bdep init -C builds/gcc-debug @gcc-debug cc config.cxx=g++ config.config.load=configs/gcc-debug.config $config_options
  bdep init -C builds/gcc-release @gcc-release cc config.cxx=g++ config.config.load=configs/gcc-release.config $config_options
}}

run{init-msvc}:
{{
  diag roguey-setup-msvc $>
  bdep init -C builds/msvc-debug @msvc-debug cc config.cxx=cl config.config.load=configs/msvc-debug.config $config_options
  bdep init -C builds/msvc-release @msvc-release cc config.cxx=cl config.config.load=configs/msvc-release.config $config_options
}}

run{nuke}:
{{
  rm -rf builds/ .bdep/ install/
}}

