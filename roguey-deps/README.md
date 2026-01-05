# roguey-deps - A C++ library

The `roguey-deps` C++ library provides <SUMMARY-OF-FUNCTIONALITY>.


## Usage

To start using `roguey-deps` in your project, add the following `depends`
value to your `manifest`, adjusting the version constraint as appropriate:

```
depends: roguey-deps ^<VERSION>
```

Then import the library in your `buildfile`:

```
import libs = roguey-deps%lib{<TARGET>}
```


## Importable targets

This package provides the following importable targets:

```
lib{<TARGET>}
```

<DESCRIPTION-OF-IMPORTABLE-TARGETS>


## Configuration variables

This package provides the following configuration variables:

```
[bool] config.roguey_deps.<VARIABLE> ?= false
```

<DESCRIPTION-OF-CONFIG-VARIABLES>
