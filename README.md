# Interview Task

## Summary

You are provided with an `Analysis` class in `analysis.rb` that contains:

- An id
- A title string
- A list of reasons

Each `Reason` contains:

- A title string
- A description string

In `main.rb`:

- Reads raw configuration from `data.yaml`
- Builds the list of `Analysis` objects from the raw configuration
- Prints the analysis to STDOUT

## Task

We need to add translations to our analysis. Currently, the YAML only allows for one place per string field to add text content, and the code only outputs in 1 language.

- We need a new YAML model that can support Spanish and French translations for the `title` and `description` string fields
- The code needs to be updated to support the new languages
- You can use Google Translate or sample text for translations
- Analysis in the different languages needs to be printed to STDOUT
- Write `rspec` unit tests for the `Analysis` class and any translation capabilities
- Bonus: apply JSON schema to the configuration file

**The design has to allow flexibility such that it will be easy in the future to add many more translations and print them out with minimal code changes**

## Current Output

```
Analysis Results
================
Analysis ID: dvpo
Analysis Title: Domestic Violence Protection Order
Analysis Reasons:
  - Physical Harm: There is physical harm, bodily injury, assault, including sexual assault, stalking, OR the infliction of fear of imminent physical harm, bodily injury or assault.
  - Intimate Relationships: The offender is a family member, a household member or someone you're dating.
----------
Analysis ID: ahpo
Analysis Title: Antiharassment Protection Order
Analysis Reasons:
  - Superior Court: Your case lacks the required conditions for filing at the Superior Court in your county.
  - Eligible Actions: You did not select an of the eligible actions which makes your case ineligible as per the legal definition of harassment.
----------
Analysis ID: sapo
Analysis Title: Sexual Assault Protection Order
Analysis Reasons:
  - Relationship: The victim's relationship with the respondent means that the Sexual Assault Protection Order may not be the appropriate protection order. Please talk to a court facilitator or legal professional to receive guidance on your case.
  - Sexual Act: There is sexual penetration, touching, display or some unwanted sexual act.
----------
```

## Expected Output

Note that the `title` and `description` fields are translated.

```
(EN) Analysis Results
================
Analysis ID: dvpo
Analysis Title: Domestic Violence Protection Order
Analysis Reasons:
  - Physical Harm: There is physical harm, bodily injury, assault, including sexual assault, stalking, OR the infliction of fear of imminent physical harm, bodily injury or assault.
  - Intimate Relationships: The offender is a family member, a household member or someone you're dating.
...
----------

(ES) Resultados de analisis
================
Analysis ID: dvpo
Analysis Title: Orden de protección contra la violencia doméstica
Analysis Reasons:
  - Daño físico: Hay daño físico, lesión corporal, agresión, incluida la agresión sexual, acecho, O la imposición de temor de daño físico inminente, lesión corporal o agresión.
  ...

(FR) Les résultats d'analyse
================
...
```
