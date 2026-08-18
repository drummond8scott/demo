-- Sentinel E: line dates are null iff claim_type = institutional. Both directions.
-- Measured 2026-08-15: institutional 34,521 of 34,521 null; professional 0 of 133,474 null.
{{ config(severity='error', tags=['sentinel', 'sentinel_e']) }}

select claim_id, claim_line_number, claim_type, claim_line_start_date
from {{ source('input_seeds', 'medical_claim') }}
where (claim_type = 'professional' and claim_line_start_date is null)
   or (claim_type = 'institutional' and claim_line_start_date is not null)