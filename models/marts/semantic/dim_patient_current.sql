{{ config(materialized='table', schema='portfolio', tags=['portfolio']) }}
select
  person_id,
  sex, race, ethnicity, birth_date, death_date, death_flag,
  age, age_group, state, zip_code, county,
  data_source
from {{ ref('core__patient') }}