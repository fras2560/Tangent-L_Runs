#!/bin/bash
TREC_EVAL_PATH="/home/d6fraser/git/trec_eval"
evaluate_folder(){
	for f in *; do
		if [ ! -d "$file" ];
		then
      		$TREC_EVAL_PATH/./trec_eval "-q" $3 $1/$f  > $2/$4$f
			echo "Processing $f file"
      	fi
	done 
}
FILES=/path/to/*
parentdir="$(dirname "$PWD")"
workingDir="$parentdir/runs"
outputDir="$parentdir/trec_eval_output"
judgementDir="$parentdir/judgements"
cd $workingDir
for d in * ;
do
	if [[ -d $d ]]; then
		# make the output directory
		mkdir "$outputDir/$d"
		cd $d
		echo "$workingdir/$d"
		echo "$outputDir/$d"
		if [ $d == "evaluatingMathFeatures" ];
		then
			evaluate_folder "$workingDir/$d" "$outputDir/$d" "$judgementDir/NTCIR12-MathWiki-main_Relevant.dat" "Relevant"
			evaluate_folder "$workingDir/$d" "$outputDir/$d" "$judgementDir/NTCIR12-MathWiki-main_PartiallyRelevant.dat" "PartiallyRelevant"
		elif [ $d == "evaluatingMathWeight" ];
		then
			evaluate_folder "$workingDir/$d" "$outputDir/$d" "$judgementDir/NTCIR12-MathWiki-main_Relevant.dat" "Relevant"
			evaluate_folder "$workingDir/$d" "$outputDir/$d" "$judgementDir/NTCIR12-MathWiki-main_PartiallyRelevant.dat" "PartiallyRelevant"
		elif [ $d == "evaluatingProximity" ];
		then
			evaluate_folder "$workingDir/$d" "$outputDir/$d" "$judgementDir/NTCIR12-MathWiki-main_Relevant.dat" "Relevant"
			evaluate_folder "$workingDir/$d" "$outputDir/$d" "$judgementDir/NTCIR12-MathWiki-main_PartiallyRelevant.dat" "PartiallyRelevant"
		elif [ $d == "evaluatingRankingFunctions" ];
		then
			evaluate_folder "$workingDir/$d" "$outputDir/$d" "$judgementDir/NTCIR12-MathWiki-main_Relevant.dat" "Relevant"
			evaluate_folder "$workingDir/$d" "$outputDir/$d" "$judgementDir/NTCIR12-MathWiki-main_PartiallyRelevant.dat" "PartiallyRelevant"
		elif [ $d == "finalEvaluation" ];
		then
			evaluate_folder "$workingDir/$d" "$outputDir/$d" "$judgementDir/ArXiv_Judgements_PartialRelevant.dat" "PartiallyRelevant"
			evaluate_folder "$workingDir/$d" "$outputDir/$d" "$judgementDir/ArXiv_Judgements_Relevant.dat" "Relevant"
		fi 
		echo "Creating output directory: $outputDir/$d"
		
		
		
		cd $workingDir
	fi
  echo "Directory: $d "
  # take action on each file. $f store current file name
done