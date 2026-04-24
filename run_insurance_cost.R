print("Startar analysprocessen...")

source("scripts/01_load_data.R")
print("Data inladdat.")

source("scripts/02_prepare_data.R")
print("Data städat och klart.")

source("scripts/03_analysis.R")
print("Regressionsanalys genomförd.")

source("scripts/04_figures.R")
print("Figurer skapade och sparade i output/figures/")

print("Hela processen är slutförd!")