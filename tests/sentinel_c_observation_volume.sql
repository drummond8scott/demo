{{ config(severity='error', tags=['sentinel', 'sentinel_c']) }}
with cur as (select count(*) as n from {{ source('input_seeds', 'observation') }})
select n from cur where abs(n - 150244) > 150244 * 0.01