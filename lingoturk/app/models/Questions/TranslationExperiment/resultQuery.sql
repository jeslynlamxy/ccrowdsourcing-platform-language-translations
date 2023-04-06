SELECT fileName, listNumber, assignmentId, hitId, workerId, origin, timestamp, partId, questionId, answer::TEXT, (data->>'Before') as Before, (data->>'After') as After, (data->>'Improvements') as Improvements, id FROM (
	(SELECT * FROM Results WHERE experimentType='TranslationExperiment') as tmp1
	LEFT OUTER JOIN Questions USING (QuestionId)
	LEFT OUTER JOIN Groups USING (PartId)
) as tmp
WHERE LingoExpModelId = 4
ORDER BY partId, questionId, workerId