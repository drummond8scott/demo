{{ config(severity='error', tags=['sentinel', 'sentinel_f']) }}
select a.member_id, a.payer, a.plan, a.enrollment_start_date, b.enrollment_start_date as overlapping_start
from {{ source('input_seeds', 'eligibility') }} a
join {{ source('input_seeds', 'eligibility') }} b
  on a.member_id = b.member_id and a.payer = b.payer and a.plan = b.plan
 and a.enrollment_start_date < b.enrollment_start_date
 and coalesce(a.enrollment_end_date, date '9999-12-31') >= b.enrollment_start_date