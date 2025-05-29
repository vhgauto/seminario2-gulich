library(tidyverse)

eje_x <- c(0, -2, 2, 0, 0)
eje_y <- c(0, 0, 0, -1, -2)
etq <- c(
  "project\nlibrary", "system\nlibrary", "lockfile", "renv\ncache", "CRAN/\nGitHub/..."
)

eje_x2 <- c(-1, 1, 1, 1)
eje_y2 <- c(.4, .4, .07, -.4)
etq2 <- c(
  "init()", "snapshot()", "status()", "restore()"
)

eje_x3 <- c(2, 2)
eje_y3 <- c(-1.4, -1.6)
etq3 <- c(
  "your computer", "the internet"
)

flecha_x <- c(-1.5, .5, 1.5)
flecha_xend <- c(-.5, 1.5, .5)
flecha_y <- c(.25, .25, -.25)
flecha_yend <- c(.25, .25, -.25)

flecha_x2 <- c(0, 0, 1.5, .5)
flecha_xend2 <- c(0, 0, .5, 1.5)
flecha_y2 <- c(-.75, -1.75, 0, 0)
flecha_yend2 <- c(-.25, -1.25, 0, 0)

borde <- .5

g <- ggplot() +
  annotate(
    geom = "text",
    x = eje_x,
    y = eje_y,
    label = etq,
    family = "Aptos",
    size = 12,
    fontface = "bold",
    color = "white"
  ) +
  annotate(
    geom = "text",
    x = eje_x2,
    y = eje_y2,
    label = etq2,
    family = "JetBrains Mono",
    size = 7,
    color = "white"
  ) +
  annotate(
    geom = "text",
    x = eje_x3,
    y = eje_y3,
    label = etq3,
    family = "Aptos",
    size = 7,
    hjust = 1,
    color = "grey"
  ) +
  annotate(
    geom = "curve",
    x = flecha_x,
    y = flecha_y,
    xend = flecha_xend,
    yend = flecha_yend,
    curvature = -.1,
    arrow = arrow(angle = 20, length = unit(10, "pt"), type = "closed"),
    color = "white",
    linewidth = 1
  ) +
  annotate(
    geom = "curve",
    x = flecha_x2,
    y = flecha_y2,
    xend = flecha_xend2,
    yend = flecha_yend2,
    curvature = 0,
    arrow = arrow(angle = 20, length = unit(10, "pt"), type = "closed"),
    color = "white",
    linewidth = 1
  ) +
  annotate(
    geom = "segment",
    x = -2.2,
    y = -1.5,
    xend = 2.2,
    yend = -1.5,
    color = "grey",
    linewidth = 1
  ) +
  coord_equal(
    xlim = c(min(eje_x)-borde, max(eje_x)+borde),
    ylim = c(min(eje_y)-borde/2, max(eje_y2)+borde/2),
    expand = FALSE,
    clip = "off") +
  theme_void()

ggsave(
  plot = g,
  filename = "img/rnev_gg.png",
  width = 30,
  height = 18,
  units = "cm"
)

browseURL(paste0(getwd(), "/img/rnev_gg.png"))
