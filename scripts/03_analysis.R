# Undersöker rökningens inverkan på kostnader. 
# Medelvärde och median beräknas för att se om extrema utliggare påverkar snittet.
insurance %>%
  group_by(smoker) %>%
  summarise(
    count = n(),
    mean_charge = mean(charges),
    median_charge = median(charges)
  )

# Analys av träningsnivåns koppling till premierna.
# Sorteras för att se om det finns en linjär trend (low -> medium -> high).
insurance %>%
  group_by(exercise_level) %>%
  summarise(
    mean_charge = mean(charges)
  ) %>%
  arrange(desc(mean_charge))

# --- Variabelbearbetning ---

# Skapar en dikotom variabel för BMI (fetma-gräns vid 30).
# Motivering: Underlättar tolkning av riskgrupper i tabeller och grafer.
insurance <- insurance %>%
  mutate(bmi_group = ifelse(bmi >= 30, "Obese (30+)", "Non-Obese (<30)"))

# --- Deskriptiv sammanställning av interaktionseffekter ---

# Skapar en sammanfattande tabell för rökning och BMI-status.
# Vi sparar denna i 'bmi_summary' för att kunna använda den i rapporten/Quarto.
bmi_summary <- insurance %>%
  group_by(smoker, bmi_group) %>%
  summarise(
    count = n(),
    mean_cost = mean(charges),
    median_cost = median(charges),
    .groups = 'drop'
  ) %>%
  arrange(desc(mean_cost))

# Visar tabellen i konsolen
print(bmi_summary)

# --- Regressionsanalys ---

# Modell A: Enkel basmodell (G-nivå)
model_simple <- lm(charges ~ age + bmi + smoker, data = insurance)
summary(model_simple)

# Modell B: Avancerad interaktionsmodell (VG-nivå)
# Inkluderar interaktionsterm (bmi * smoker) samt kontroller för livsstil/hälsa.
model_advanced <- lm(charges ~ age + bmi * smoker + exercise_level + chronic_condition, data = insurance)
summary(model_advanced)