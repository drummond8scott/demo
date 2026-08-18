# Contract: medical_claim (seed handoff, learn_tuva.input_layer.medical_claim)
Grain and key: one row per claim line; (claim_id, claim_line_number, data_source). Verified 2026-08-15.
Natural key: does not exist at line grain. Measured 2026-08-15: (member_id, claim_start_date, claim_end_date,
  claim_line_number, claim_type, charge_amount) collides on hundreds of professional lines with charge 0;
  adding claim_id makes it unique.
Density: header dates, charge_amount, payer, data_source, member_id fully populated. claim_line_start_date,
  claim_line_end_date, allowed_amount, place_of_service null on institutional lines only (34,521 of 34,521),
  never on professional (0 of 133,474).
Corrections: full restatement with tombstones. Re-keying claim_id is a breaking change requiring advance notice.
Delivery cadence and freshness: monthly by the fifth business day (declared). Freshness NOT measurable at this
  handoff; producer supplies no load timestamp.
Volume band and baselines: 167,995 rows, tolerance 1 percent (Sentinel C). Distinct claim_id baseline
  87127 (Sentinel D).
Sentinels in force: A technical grain; C volume; D identity; E line-date rule (both directions);
  not_null on claim_id, member_id. All tagged sentinel.
Open items: none.