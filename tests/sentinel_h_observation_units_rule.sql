{{ config(severity='error', tags=['sentinel', 'sentinel_h']) }}
select observation_id, result, source_units
from {{ source('input_seeds', 'observation') }}
where (try_cast(result as double) is not null and source_units is null)
   or (try_cast(result as double) is null and source_units is not null)