# Contract: observation
Handoff: learn_tuva.input_layer.observation (seed table loaded by package post-hook from Tuva public bucket)
Verified: 2026-08-15

## Grain and key
One row per observation.
Key: observation_id. Unique: verified, 0 duplicate groups.

## Natural key
Nearly exists: (person_id, observation_date, source_code, result) has 8 duplicate groups of 150,244 rows,
all vitals (LOINC 2708-6 oxygen saturation, 29463-7 body weight), for two persons (11334, 12995) on two dates
each, consistent with a duplicated vitals panel carrying distinct observation_ids.
Consequence: not asserted as unique. Monitored at its observed baseline (Sentinel B-observed, threshold 8);
growth in duplicate groups is a defect, the known 8 are not.

## Density (rows = 150,244)
Rule verified: source_units is present if and only if result is numeric. Numeric results 60,928, all with
  source_units; text results 89,316, all without. 0 exceptions in either direction.
normalized_units is null on all 150,244 rows: normalization is not performed at this handoff. Documented,
  not asserted (a future delivery populating it is an improvement, not a defect).

## Corrections
Append-only. Corrections arrive as new rows; a re-sent observation_id is a duplicate delivery. Breaking
changes requiring advance notice: removal or retyping of observation_id, person_id, result, source_units.

## Delivery cadence and freshness
Declared SLA: daily by 04:00. Freshness measurable at this handoff: no.

## Volume band and baselines
Rows: 150,244, tolerance 1 percent (Sentinel C).
Natural-key duplicate groups: 8 (Sentinel B-observed threshold).

## Sentinels in force
A unique observation_id, tag sentinel_a
B-observed natural-key duplicate groups must not exceed 8, tag sentinel_b
C volume control against 150,244, tag sentinel_c
H units rule, both directions (source_units present iff result numeric), tag sentinel_h
not_null on observation_id, person_id
Proof of catch: see P1.C2 (planted numeric row with units stripped; H fires).

## Open items
Column-level density beyond the units rule not yet profiled (source_code_type, normalized_code, encounter_id).