--Q1.A
SELECT prescriber.npi, SUM(total_claim_count)AS grand_total_claims
FROM prescriber INNER JOIN prescription
ON prescriber.npi = prescription.npi
GROUP BY prescriber.npi
ORDER BY SUM(total_claim_count) DESC;
--Answer NPI: 1881634483, claim:99707
--Q1.B
SELECT nppes_provider_first_name, SUM(total_claim_count)AS grand_total_claims
FROM prescriber INNER JOIN prescription
ON prescriber.npi = prescription.npi
GROUP BY nppes_provider_first_name
ORDER BY SUM(total_claim_count) DESC;
--Answer: James
--Q1.C
SELECT nppes_provider_last_org_name, SUM(total_claim_count)AS grand_total_claims
FROM prescriber INNER JOIN prescription
ON prescriber.npi = prescription.npi
GROUP BY nppes_provider_last_org_name
ORDER BY SUM(total_claim_count) DESC;
--Smith
--Q1.D
SELECT specialty_description, SUM(total_claim_count)AS grand_total_claims
FROM prescriber INNER JOIN prescription
ON prescriber.npi = prescription.npi
GROUP BY specialty_description
ORDER BY SUM(total_claim_count) DESC;
--Family Practice

