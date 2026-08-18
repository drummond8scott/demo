-- Sentinel C: volume control against an independently recorded baseline.
-- Baseline 167,995 recorded 2026-08-15 from the Milestone A build, BEFORE any incident.
-- Fails if current count drifts more than 1% from baseline in either direction.
{{ config(severity='error', tags=['sentinel', 'sentinel_c']) }}

with cur as (
  select count(*) as n from {{ source('input_seeds', 'medical_claim') }}
)
select n
from cur
where abs(n - 167995) > 167995 * 0.01