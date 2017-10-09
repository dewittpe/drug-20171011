Denver R User Group: October 2017
=====

Lighting Talks

My quick talk overviews the changes to programming with dplyr functions since
version 0.7.0 was released.

The major changes: the underscored versions of the dplyr verbs, e.g., `mutate_`,
`select_`, `rename_`, etc., have been deprecated.  The standard versions, e.g.,
`mutate`, `select`, `rename`, etc., use non-standard evaluation and the
underscore versions were provided for standard evaluation.

With version 0.7.0 quosures were introduced allowing the standard verbs to be
used and the underscore version of the functions to be superfluous.

My talk will show how to build functions in packages with dplyr >= 0.7.0

## Navigate this talk:
No slides.  Instead, use git and checkout each tag and look at the files and run

    make check

to run `R CMD check` and see the warnings and notes that come up.  Comments in
the code and/or this read me file will be used to note talking points.

## Tags

1. `step00` The initial commit with just this `README.md` file.
2. `step01` Shows use of `dplyr::filter_` with `lazyeval::interp`

