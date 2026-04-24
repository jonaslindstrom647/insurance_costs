# Analys av försäkringskostnader

Det här projektet analyserar vilka faktorer som driver försäkrings-
kostnader och bygger en regressionsmodell som kan användas som 
beslutsstöd för prissättning.

**Författare:** Jonas Lindström

## Projektstruktur

- `data/insurance_costs.csv` – rådata
- `scripts/01_load_data.R` – läser in data
- `scripts/02_prepare_data.R` – städar och förbereder data
- `scripts/03_analysis.R` – regressionsanalys
- `scripts/04_figures.R` – skapar figurer
- `report/insurance_cost_report.qmd` – källkod för rapporten
- `report/insurance_cost_report.html` – färdig rapport (öppna denna!)
- `output/figures/` – sparade figurer (PNG)
- `run_insurance_cost.R` – kör hela analysen
- `insurance_costs.Rproj` – RStudio-projektfil


## Så här kommer du igång

### Läsa rapporten
Öppna `report/insurance_cost_report.html` i valfri webbläsare.

### Köra projektet i RStudio

1. Öppna `insurance_costs.Rproj` i RStudio
2. Installera paket (vid behov):

​```r
install.packages(c("tidyverse", "knitr", "broom"))
​```

3. Kör hela analysen:

​```r
source("run_insurance_cost.R")
​```

### Rendera rapporten på nytt

Öppna `report/insurance_cost_report.qmd` och klicka på **Render** i RStudio, 
eller kör i terminalen:

​```bash
quarto render report/insurance_cost_report.qmd
​```

## Paket som används

- **tidyverse** – datahantering och visualisering
- **knitr** – rapportgenerering och tabeller
- **broom** – formatering av modellresultat

## Output

- `report/insurance_cost_report.html` – den färdiga rapporten
- `output/figures/` – exporterade figurer som PNG
