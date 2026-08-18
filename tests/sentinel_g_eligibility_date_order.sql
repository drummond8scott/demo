{{ config(severity='error', tags=['sentinel', 'sentinel_g']) }}
select member_id, enrollment_start_date, enrollment_end_date
from {{ source('input_seeds', 'eligibility') }}
where enrollment_end_date < enrollment_start_date