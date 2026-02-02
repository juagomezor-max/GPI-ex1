# ==============================================================================
# SCRIPT: Visualizaciones Completas
# ==============================================================================

# 1. LIMPIAR EL ENTORNO
rm(list = ls())

# 2. CARGAR PAQUETES REQUERIDOS
library(dplyr)
library(readr)
library(ggplot2)
library(plotly)
library(gridExtra)

# 3. CARGAR DATOS
cleaned_data <- read_csv("data/clean/cleaned_data.csv")
analysis_results <- read_csv("resultados/analysis_results.csv")

# 4. CREAR GRÁFICOS

# 4.1 Gráfico de barras: Valor total por región
plot1 <- ggplot(
    analysis_results,
    aes(x = region, y = total_value, fill = region)
) +
    geom_bar(stat = "identity") +
    labs(
        title = "Valor Total por Región",
        x = "Región",
        y = "Valor Total"
    ) +
    theme_bw() +
    theme(legend.position = "none")

ggsave(
    "resultados/01_valor_por_region.png",
    plot = plot1,
    width = 10,
    height = 6,
    dpi = 300
)
cat("✓ Guardado: resultados/01_valor_por_region.png\n")

# 4.2 Gráfico de dispersión: Cantidad vs Ganancia
plot2 <- ggplot(
    cleaned_data,
    aes(x = amount, y = profit, color = region)
) +
    geom_point(alpha = 0.6, size = 2) +
    labs(
        title = "Relación entre Cantidad y Ganancia",
        x = "Cantidad",
        y = "Ganancia",
        color = "Región"
    ) +
    theme_bw()

ggsave(
    "resultados/02_cantidad_vs_ganancia.png",
    plot = plot2,
    width = 10,
    height = 6,
    dpi = 300
)
cat("✓ Guardado: resultados/02_cantidad_vs_ganancia.png\n")

# 4.3 Boxplot: Distribución de cantidad por región
plot3 <- ggplot(
    cleaned_data,
    aes(x = region, y = amount, fill = region)
) +
    geom_boxplot(alpha = 0.7) +
    labs(
        title = "Distribución de Cantidad por Región",
        x = "Región",
        y = "Cantidad"
    ) +
    theme_bw() +
    theme(legend.position = "none")

ggsave(
    "resultados/03_boxplot_cantidad.png",
    plot = plot3,
    width = 10,
    height = 6,
    dpi = 300
)
cat("✓ Guardado: resultados/03_boxplot_cantidad.png\n")

# 4.4 Gráfico de barras agrupado: Promedio por región y estado
plot4 <- ggplot(
    analysis_results,
    aes(x = region, y = average_amount, fill = status)
) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(
        title = "Promedio de Cantidad por Región y Estado",
        x = "Región",
        y = "Promedio de Cantidad",
        fill = "Estado"
    ) +
    theme_bw()

ggsave(
    "resultados/04_promedio_region_estado.png",
    plot = plot4,
    width = 10,
    height = 6,
    dpi = 300
)
cat("✓ Guardado: resultados/04_promedio_region_estado.png\n")

# 4.5 Gráfico interactivo: Scatter plot con Plotly
interactive_plot <- plot_ly(
    cleaned_data,
    x = ~amount,
    y = ~profit,
    color = ~region,
    size = ~value,
    type = "scatter",
    mode = "markers",
    marker = list(opacity = 0.7, sizemode = "diameter")
) %>%
    layout(
        title = "Gráfico Interactivo: Ganancia vs Cantidad",
        xaxis = list(title = "Cantidad"),
        yaxis = list(title = "Ganancia"),
        hovermode = "closest"
    )

htmlwidgets::saveWidget(
    as_widget(interactive_plot),
    file = "resultados/05_grafico_interactivo.html",
    selfcontained = FALSE
)
cat("✓ Guardado: resultados/05_grafico_interactivo.html\n")

# 4.6 Crear una grilla con todos los gráficos
combined_plots <- gridExtra::grid.arrange(
    plot1, plot2,
    plot3, plot4,
    nrow = 2, ncol = 2
)

ggsave(
    "resultados/06_todos_los_graficos_grid.png",
    plot = combined_plots,
    width = 16,
    height = 12,
    dpi = 300
)
cat("✓ Guardado: resultados/06_todos_los_graficos_grid.png\n")

# Mensaje de resumen
cat("\n")
cat(strrep("=", 60), "\n")
cat("¡Todos los gráficos se crearon correctamente!\n")
cat("Ubicación: resultados/\n")
cat(strrep("=", 60), "\n")
