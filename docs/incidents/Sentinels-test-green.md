0:27:31  1 of 8 START test dbt_utils_source_unique_combination_of_columns_input_seeds_eligibility_person_id__member_id__enrollment_start_date__enrollment_end_date__plan__payer__data_source  [RUN]
20:27:31  2 of 8 START test dbt_utils_source_unique_combination_of_columns_input_seeds_medical_claim_claim_id__claim_line_number__data_source  [RUN]
20:27:31  3 of 8 START test sentinel_c_medical_claim_volume .............................. [RUN]
20:27:31  4 of 8 START test sentinel_d_medical_claim_identity ............................ [RUN]
20:27:31  5 of 8 START test sentinel_e_medical_claim_line_dates .......................... [RUN]
20:27:31  6 of 8 START test source_not_null_input_seeds_eligibility_member_id ............ [RUN]
20:27:31  7 of 8 START test source_not_null_input_seeds_medical_claim_claim_id ........... [RUN]
20:27:31  8 of 8 START test source_not_null_input_seeds_medical_claim_member_id .......... [RUN]
20:27:31  6 of 8 PASS source_not_null_input_seeds_eligibility_member_id .................. [PASS in 0.40s]
20:27:31  2 of 8 PASS dbt_utils_source_unique_combination_of_columns_input_seeds_medical_claim_claim_id__claim_line_number__data_source  [PASS in 0.41s]
20:27:31  8 of 8 PASS source_not_null_input_seeds_medical_claim_member_id ................ [PASS in 0.42s]
20:27:32  1 of 8 PASS dbt_utils_source_unique_combination_of_columns_input_seeds_eligibility_person_id__member_id__enrollment_start_date__enrollment_end_date__plan__payer__data_source  [PASS in 0.44s]
20:27:32  3 of 8 PASS sentinel_c_medical_claim_volume .................................... [PASS in 0.44s]
20:27:32  5 of 8 PASS sentinel_e_medical_claim_line_dates ................................ [PASS in 0.45s]
20:27:32  7 of 8 PASS source_not_null_input_seeds_medical_claim_claim_id ................. [PASS in 0.50s]
20:27:32  4 of 8 PASS sentinel_d_medical_claim_identity .................................. [PASS in 0.85s]
20:27:32  
20:27:32  1 of 1 START hook: the_tuva_project.on-run-end.0 ............................... [RUN]
20:27:32  1 of 1 OK hook: the_tuva_project.on-run-end.0 .................................. [OK in 0.00s]
20:27:32  
20:27:32  Finished running 2 project hooks, 8 data tests in 0 hours 0 minutes and 3.93 seconds (3.93s).
20:27:33  
20:27:33  Completed successfully