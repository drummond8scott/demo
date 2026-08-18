{{ config(severity='error', tags=['sentinel', 'sentinel_c']) }}
with cur as (select count(*) as n from {{ source('input_seeds', 'eligibility') }})
select n from cur where abs(n - 2309) > 2309 * 0.01