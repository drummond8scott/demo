# Contract: eligibility
Handoff: learn_tuva.input_layer.eligibility (seed table loaded by package post-hook from Tuva public bucket)
Verified: 2026-08-15

## Grain and key
One row per enrollment span per member per payer and plan.
Key: (person_id, member_id, enrollment_start_date, enrollment_end_date, plan, payer, data_source).
Unique: verified, 0 duplicate groups.

## Natural key
Exists: (member_id, enrollment_start_date, payer, plan) is unique. Verified, 0 duplicate groups.
Consequence: unlike medical_claim, a span's identity is recoverable without the technical key.

## Density (rows = 2,309)
Always populated (0 nulls): member_id, person_id, enrollment_start_date, enrollment_end_date, payer, plan,
  birth_date, medicare_status_code.
Notable: enrollment_end_date has 0 nulls, so this dataset contains NO open spans. A future delivery that
  introduces open (null-ended) spans is a behavior change and will fire the not_null sentinel; the contract
  should then be revised deliberately, not the test loosened silently.
Sparse under a plausible rule (not asserted): death_date null 2,242 (67 deceased); dual_status_code null 1,871
  (438 dual-eligible).

## Rules verified
No overlapping spans for the same member, payer, plan (0 rows).
No enrollment_end_date earlier than enrollment_start_date (0 rows).

## Corrections
Spans are updated in place when a member disenrolls (end date set); monthly full-file delivery replaces prior
state. Breaking changes requiring advance notice: a member appearing under a new member_id without a crosswalk;
removal or retyping of any key column.

## Delivery cadence and freshness
Declared SLA: monthly by the fifth business day. Freshness measurable at this handoff: no.

## Volume band and baselines
Rows: 2,309, tolerance 1 percent (Sentinel C).

## Sentinels in force
A technical grain on the seven-column key, tag sentinel_a
B natural key (member_id, enrollment_start_date, payer, plan), tag sentinel_b
C volume control against 2,309, tag sentinel_c
F span overlap rule, tag sentinel_f
G date order rule, tag sentinel_g
not_null on member_id, enrollment_start_date, enrollment_end_date
Proof of catch: see P1.C1 (planted overlap; F fires).

## Open items
death_date and dual_status_code sparsity documented, not asserted (no rule identified beyond plausibility).