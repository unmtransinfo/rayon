#!/bin/bash
tcrd_host="tcrd.kmc.io"
tcrd_database="tcrd6110"
tcrd_user="tcrd"
mysql -A -h $tcrd_host -u $tcrd_user $tcrd_database <<EOF >>target_list.tsv
SELECT
	target.id AS "tcrdTargetId",
	target.name AS "tcrdTargetName",
	target.fam AS "tcrdTargetFamily",
	target.tdl AS "TDL",
	target.idg AS "idgList",
	protein.id AS "tcrdProteinId",
	protein.sym AS "tcrdGeneSymbol",
	protein.family AS "tcrdProteinFamily",
	protein.geneid AS "ncbiGeneId",
	protein.uniprot AS "uniprotId",
	protein.up_version AS "uniprotVersion",
	protein.name AS "proteinName",
	protein.stringid AS "ensemblProteinId",
	protein.description AS "proteinDesc",
	protein.dtoid AS "dtoId"
FROM
	target
JOIN
	t2tc ON t2tc.target_id = target.id
JOIN
	protein ON protein.id = t2tc.protein_id
        ;
EOF
