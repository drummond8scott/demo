{{ config(materialized='table', schema='portfolio', tags=['portfolio']) }}
select
  encounter_id, person_id, admit_date, discharge_date, facility_id, drg_code, drg_code_type,
  length_of_stay, index_admission_flag, planned_flag, died_flag,
  had_readmission_flag, days_to_readmit, readmit_30_flag, unplanned_readmit_30_flag,
  readmission_encounter_id, readmission_admit_date
from {{ ref('readmissions__readmission_summary') }}