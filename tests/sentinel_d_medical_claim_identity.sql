-- Sentinel D: distinct claim_id count against recorded baseline.
-- Baseline 87127 recorded 2026-08-15 before any incident.
-- A re-key that lands new IDs alongside originals inflates this while headers stay flat.
{{ config(severity='error', tags=['sentinel', 'sentinel_d']) }}

with cur as (
  select count(distinct claim_id) as n
  from {{ source('input_seeds', 'medical_claim') }}
)
select n from cur
where abs(n - 87127) > 87127 * 0.01