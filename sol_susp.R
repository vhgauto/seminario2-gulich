library(tidyverse)

crudo <- readxl::read_xlsx(
    path = "C:/Users/victo/OneDrive - Facultad Regional Resistencia/GISTAQ/PROYECTOS/PIDs UTN/2023 PROY ESTIMAR INDICADORES DE CALIDAD EN RÍO PARANÁ/MUESTREOS Y ENSAYOS DE LAB/2025 Todos_los_parametros_Victor.xlsx",
    sheet = 1,
    .name_repair = "unique_quiet") |>
    select(
      fecha = 1, longitud = 4, latitud = 5, ph = 6, cond = 8, secchi = 10,
      sol_sus = 12, turb = 13, hazemeter = 14)

tidy <- crudo |>
  filter(row_number() > 20) |>
  fill(fecha) |>
  mutate(
    across(
      .cols = everything(),
      .fns = as.numeric
    )
  ) |>
  drop_na() |>
  mutate(
    muestra = c(1:14, paste0(11:13, "X"))
  )

crudo |>
  filter(row_number() > 20) |>
  fill(fecha) |>
  mutate(
    across(
      .cols = everything(),
      .fns = as.numeric
    )
  ) |>
  drop_na() |>
  select(longitud, sol_sus) |>
  mutate(
    sitio = c(1:14, 11:13)
  ) |>
  mutate(
    tipo = if_else(
      row_number() %in% 1:14,
      "original",
      "dup"
    )
  ) |>
  pivot_wider(
    names_from = tipo,
    values_from = sol_sus
  ) |>
  mutate(
    dup = if_else(
      is.na(dup),
      original,
      dup
    )
  ) |>
  pivot_longer(
    cols = c(original, dup),
    names_to = "tipo",
    values_to = "sol_sus"
  ) |>
  ggplot(aes(longitud, sol_sus, group = tipo, color = tipo)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label = sitio), nudge_y = 5, color = "black") +
  scale_y_continuous(breaks = scales::breaks_width(5))

tidy |>
  filter(!str_detect(muestra, "X")) |>
  ggplot(
    aes(longitud, sol_sus)
  ) +
    geom_line()


