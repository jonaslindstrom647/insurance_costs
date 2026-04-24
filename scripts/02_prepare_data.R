# För en överblick över datasetet
glimpse(insurance_cost)
# En kort sammanfatting för att se klasser och annat
summary(insurance_cost)

# Frekvensanalys: Kontrollerar inkonsekvenser i kategoriska variabler (t.ex. stavning/stora bokstäver)
insurance_cost %>%
  count(customer_id)
insurance_cost %>%
  count(sex)
insurance_cost %>%
  count(region)
insurance_cost %>%
  count(smoker)
insurance_cost %>%
  count(chronic_condition)
insurance_cost %>%
  count(exercise_level)
insurance_cost %>%
  count(plan_type)

# Identifiera saknade värden (NA) som kan påverka regressionsmodellens precision
colSums(is.na(insurance_cost))

# Städar data och tar bort NA värden och anpassar variabler till små bokstäver
nrow(insurance_cost) 
insurance_clean <-insurance_cost %>% drop_na(bmi, exercise_level, annual_checkups)
nrow(insurance_clean)

insurance <- insurance_clean %>% 
  mutate (
    sex = str_trim(sex),
    sex = str_to_lower(sex),
    region = str_trim(region),
    region = str_to_lower(region),
    smoker = str_trim(smoker),
    smoker = str_to_lower(smoker),
    chronic_condition = str_trim(chronic_condition),
    chronic_condition = str_to_lower(chronic_condition),
    exercise_level = str_trim(exercise_level),
    exercise_level = str_to_lower(exercise_level),
    plan_type = str_trim(plan_type),
    plan_type = str_to_lower(plan_type),
    sex = as.factor(sex),
    region = as.factor(region),
    smoker = as.factor(smoker),
    chronic_condition = as.factor(chronic_condition),
    exercise_level = as.factor(exercise_level),
    plan_type = as.factor(plan_type),
  )

# En ny överblick och Verifierar att städningen lyckats och att inga NA återstår
glimpse(insurance)
summary(insurance)
colSums(is.na(insurance))

insurance %>%
  count(customer_id)
insurance %>%
  count(sex)
insurance %>%
  count(region)
insurance %>%
  count(smoker)
insurance %>%
  count(chronic_condition)
insurance %>%
  count(exercise_level)
insurance %>%
  count(plan_type)