{{ config(severity='error', tags=['sentinel', 'sentinel_b']) }}
-- Known baseline: 8 duplicate groups (vitals panels, 2 persons). Growth is a defect.
select count(*) as dup_groups
from (
  select person_id, observation_date, source_code, result
  from {{ source('input_seeds', 'observation') }}
  group by 1,2,3,4 having count(*) > 1
)
having count(*) > 8