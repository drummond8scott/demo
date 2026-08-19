{{ config(materialized='table', schema='portfolio', tags=['portfolio']) }}
select
  encounter_id, person_id,
  encounter_end_date, year_month,
  ed_classification_description, ed_classification_order,
  primary_diagnosis_code, paid_amount, allowed_amount, facility_id
from {{ ref('ed_classification__summary') }}