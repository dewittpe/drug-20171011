# Programming with dplyr
#
# read the vignette
# vignette("programming", package = "dplyr")

# let's dig into the first example of Non-standard evaluation
# 
# dplyr::filter(dat, a == 1, b == 2) can be interpreted four different ways.
#
# 1. dat[dat$a == 1 & dat$b == 2, ]
# 2. dat[dat$a == 1 & b == 2, ]
# 3. dat[a == 1,    & dat$b == 2, ]
# 4. dat[a == 1,    & b == 2, ]

# proof:
dat1 <- dplyr::data_frame(a = c(1, 2, 1, 1, 2, 1),
                          b = c(1, 1, 1, 2, 2, 2),
                          c = 1:6)
dat2 <- dplyr::rename(dat1, bb = b)
dat3 <- dplyr::rename(dat1, aa = a)
dat4 <- dplyr::rename(dat1, aa = a, bb = b)

a <- c(0, 1, 0, 0, 0, 1)
b <- c(2, 2, 2, 0, 2, 2)

dplyr::filter(dat1, a == 1, b == 2) 
dplyr::filter(dat2, a == 1, b == 2)
dplyr::filter(dat3, a == 1, b == 2)
dplyr::filter(dat4, a == 1, b == 2)

# The above occures because "most dplyr arguments are not referentially
# transparent."
# This issue continues into the programming world:

my_filter <- function(dat) {
  dplyr::filter(dat, a == 1, b == 2)
}

my_filter(dat1)
my_filter(dat2)
my_filter(dat3)
my_filter(dat4)

# How do we fix this?  Use the data pronoun for tidy evaluation 
# rlang::.data
my_filter <- function(dat) {
  dplyr::filter(dat, .data$a == 1, .data$b == 2)
}

my_filter(dat1)  # Good
my_filter(dat2)  # useful error?
my_filter(dat3)  # useful error?
my_filter(dat4)  # useful error?

# now, how to use a function like my_filter in a package?
