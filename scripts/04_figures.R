# Histogram för att kontrollera fördelningen av charges. 
# Viktigt för att se om data är normalfördelat inför regressionen.
p_insurance_costs <- ggplot(insurance, aes(x = charges)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  theme_minimal() +
  labs(title = "Fördelning av försäkringskostnader",
       x = "Kostnad (charges)",
       y = "Antal kunder")

p_insurance_costs

# För att jämföra försäkringskostnader mellan rökare och icke-rökare skapas ett boxplot-diagram.
# Boxploten visar fördelningen av kostnader för respektive grupp, vilket gör det enkelt att se skillnader i median, spridning och eventuella extremvärden. 
p_smoker_nonsmoker_costs <- ggplot(insurance, aes(x = smoker, y = charges, fill = smoker)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Kostnader för rökare vs icke-rökare",
       x = "Rökare",
       y = "Kostnad")

p_smoker_nonsmoker_costs

# För att undersöka hur ålder påverkar försäkringskostnader 
p_smoker_nonsmoker_age_costs <- ggplot(insurance, aes(x = age, y = charges, color = smoker)) +
  geom_point(alpha = 0.5) +
  theme_minimal() +
  labs(title = "Samband mellan ålder och kostnad",
       subtitle = "Uppdelat på rökare/icke-rökare",
       x = "Ålder",
       y = "Kostnad")

p_smoker_nonsmoker_age_costs

# Scatterplot med trendlinjer (interaction plot). 
# Syftet är att visuellt bekräfta om lutningen för BMI skiljer sig mellan rökare/icke-rökare.
p_smoker_bmi_costs <- ggplot(insurance, aes(x = bmi, y = charges, color = smoker)) +
  geom_point(alpha = 0.4) + 
  geom_smooth(method = "lm", se = TRUE) + 
  scale_color_manual(values = c("no" = "green", "yes" = "red")) + 
  theme_minimal() +
  labs(
    title = "Samband mellan BMI och kostnad baserat på rökning",
    subtitle = "Notera hur den röda linjen (rökare) lutar brantare än den gröna",
    x = "BMI",
    y = "Försäkringskostnad (charges)",
    color = "Rökare"
  )

p_smoker_bmi_costs

# ggsave("output/figures/p_insurance_costs.png", p_insurance_costs, width = 8, height = 5)
# ggsave("output/figures/p_smoker_nonsmoker_costs.png", p_smoker_nonsmoker_costs, width = 8, height = 5)
# ggsave("output/figures/p_smoker_nonsmoker_age_costs.png", p_smoker_nonsmoker_age_costs, width = 8, height = 5)
# ggsave("output/figures/p_smoker_bmi_costs.png", p_smoker_bmi_costs, width = 8, height = 5)