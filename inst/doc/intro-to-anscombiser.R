## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE, out.width = '80%', fig.align = 'center', fig.width = 7, fig.height = 7)
knitr::opts_knit$set(global.par = TRUE)

## ----setup--------------------------------------------------------------------
library(anscombiser)

## ----par, echo = FALSE--------------------------------------------------------
opar <- graphics::par(no.readonly = TRUE)
graphics::par(mar = c(4, 4, 1, 1))

## ----anscombe-----------------------------------------------------------------
new_faithful <- anscombise(datasets::faithful, which = 4)
plot(new_faithful)
plot(new_faithful, input = TRUE)

## ----italy--------------------------------------------------------------------
italy <- mapdata("Italy")
new_italy <- anscombise(italy, which = 4)
plot(new_italy)

## ----check, echo = FALSE------------------------------------------------------
got_datasauRus <- requireNamespace("datasauRus", quietly = TRUE)
got_maps <- requireNamespace("maps", quietly = TRUE)
got_both <- got_datasauRus & got_maps

## ----dino, eval = got_both----------------------------------------------------
library(datasauRus)
library(maps)
dino <- datasaurus_dozen_wide[, c("dino_x", "dino_y")]
UK <- mapdata("UK")
new_UK <- mimic(UK, dino)
plot(new_UK, legend_args = list(x = "right"))
plot(new_UK, input = TRUE, legend_args = list(x = "topright"))

## ---- trump, eval = got_both--------------------------------------------------
new_dino <- mimic(dino, trump)
plot(new_dino, legend_args = list(x = "topright"))
plot(new_dino, input = TRUE, legend_args = list(x = "bottomright"), pch = 20)

## ---- 3D----------------------------------------------------------------------
new_randu <- mimic(datasets::randu, datasets::trees)
# new_randu and trees share the same sample summary statistics
new_randu_stats <- get_stats(new_randu)
trees_stats <- get_stats(datasets::trees)
# For example
trees_stats$correlation
new_randu_stats$correlation
pairs(trees)
pairs(new_randu)

## ----resetpar, echo = FALSE---------------------------------------------------
graphics::par(opar)

