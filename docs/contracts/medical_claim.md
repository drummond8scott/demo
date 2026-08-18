# Contract: medical_claim
Handoff: learn_tuva.input_layer.medical_claim (seed table loaded by package post-hook from Tuva public bucket)
Verified: 2026-08-15

## Grain and key
One row per claim line.
Key: (claim_id, claim_line_number, data_source). Unique: verified, 0 duplicate groups.

## Natural key
Does not exist at line grain.
Evidence: (member_id, claim_start_date, claim_end_date, claim_line_number, claim_type, charge_amount)
collides on hundreds of professional lines, most with charge_amount = 0; adding claim_id makes it unique.
Consequence: a re-key cannot be caught by structure; identity is guarded by behavior (Sentinels C, D).

## Density (rows = 167,995)
Always populated: member_id, claim_id, claim_line_number, claim_type, claim_start_date, claim_end_date,
  charge_amount, payer, data_source.
Null under a rule: claim_line_start_date, claim_line_end_date, allowed_amount, place_of_service_code
  are null on institutional lines only (34,521 of 34,521) and never on professional (0 of 133,474).
Sparse (no rule asserted): hcpcs_code null 11,655; revenue_center_code null 134,871; billing_npi null 165,220;
  facility_npi null 133,474; paid_amount null 25,895.

## Corrections
Corrections present as full restatement with tombstones for superseded rows.
Breaking changes requiring advance notice: removal or retyping of any key column; re-keying of claim_id.

## Delivery cadence and freshness
Declared SLA: monthly by the fifth business day.
Freshness measurable at this handoff: no (producer supplies no load timestamp). Optional proxy in P1.D.

## Volume band and baselines
Rows: 167,995, tolerance 1 percent (Sentinel C).
Distinct claim_id: <your recorded number>, tolerance 1 percent (Sentinel D).

## Sentinels in force
A technical grain (dbt_utils.unique_combination_of_columns on the key), tag sentinel_a
C volume control against 167,995, tag sentinel_c
D identity control against distinct claim_id baseline, tag sentinel_d
E line-date rule, both directions (null iff institutional), tag sentinel_e
not_null on claim_id, member_id
Proof of catch: 2026-08-15 re-key incident; A passed, C and D failed. docs/incidents/2026-08-15-medical-claim-rekey.md

## Open items
None.