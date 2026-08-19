{{ config(materialized='table', schema='portfolio', tags=['portfolio']) }}
select
  member_month_key,
  person_id, member_id, year_month, payer, plan, data_source
from {{ ref('core__member_months') }}