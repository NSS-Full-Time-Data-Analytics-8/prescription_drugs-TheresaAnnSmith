--Q1.A
SELECT prescriber.npi, SUM(total_claim_count)AS grand_total_claims
FROM prescriber INNER JOIN prescription
ON prescriber.npi = prescription.npi
GROUP BY prescriber.npi
ORDER BY SUM(total_claim_count) DESC;
--Answer NPI: 1881634483, claim:99707

--Q1.B 
SELECT nppes_provider_first_name, nppes_provider_last_org_name, specialty_description, SUM(total_claim_count)
FROM prescriber INNER JOIN prescription
ON prescriber.npi = prescription.npi
GROUP BY nppes_provider_first_name, nppes_provider_last_org_name, specialty_description
ORDER BY SUM(total_claim_count) DESC;
--Answer: Bruce Pendley, Family Practice, 99707

--Q2.A
SELECT prescriber.specialty_description, SUM(prescription.total_claim_count)AS claims
FROM prescriber INNER JOIN  prescription 
USING (npi)
GROUP BY specialty_description
ORDER BY claims DESC;
--Answer: Family Practice, 9752347

--Q2.B two inner joins?? unfinished
SELECT specialty_description, drug.opioid_drug_flag, SUM(prescription.total_claim_count) AS claims
FROM prescriber 
	INNER JOIN prescription 
	USING (npi)
	INNER JOIN drug
	USING (drug_name)
WHERE opioid_drug_flag = 'Y'
GROUP BY specialty_description
ORDER BY claims DESC;