# roguey-build2 - <SUMMARY>

`roguey-build2` is a <SUMMARY-OF-FUNCTIONALITY>.

This file contains setup instructions and other details that are more
appropriate for development rather than consumption. If you want to use
`roguey-build2` in your `build2`-based project, then instead see the accompanying
package [`README.md`](<PACKAGE>/README.md) file.

The development setup for `roguey-build2` uses the standard `bdep`-based workflow.
For example:

```
git clone .../roguey-build2.git
cd roguey-build2

bdep init -C @gcc cc config.cxx=g++
bdep update
bdep test
```
