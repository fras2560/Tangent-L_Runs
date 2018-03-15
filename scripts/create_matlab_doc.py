import os


def parse_file(file, attribute, number):
	measurement = 0
	with open(file) as f:
		for line in f:
			line = line.lower().strip().replace(" ", "")
			parts = line.split("\t")
			if parts[1].endswith(number) and parts[0] == attribute:
				measurement = parts[-1]
	return measurement

# loop through all for each query
output_folder = os.path.join(os.path.dirname(os.getcwd()), "customOutput", "weights")
directory = os.path.join(os.path.dirname(os.getcwd()), "trec_eval_output", "evaluatingMathWeight")
for query in range(1, 31):
	with open(os.path.join(output_folder, "MapWeights{}.csv".format(query)), "w+") as out:
		for i in range(1, 201):
			partial = 0
			full = 0
			partial = parse_file(os.path.join(directory, "PartiallyRelevant{}.txt".format(i)), "map", "-{}".format(query))
			full = parse_file(os.path.join(directory, "Relevant{}.txt".format(i)), "map", "-{}".format(query))
			print("{:.2f},{},{}".format(i / 100, full, partial), file=out)
			print("Finished {}".format(i))

for query in range(1, 31):
	with open(os.path.join(output_folder, "BprefWeights{}.csv".format(query)), "w+") as out:
		for i in range(1, 201):
			partial = 0
			full = 0
			partial = parse_file(os.path.join(directory, "PartiallyRelevant{}.txt".format(i)), "bpref", "-{}".format(query))
			full = parse_file(os.path.join(directory, "Relevant{}.txt".format(i)), "bpref", "-{}".format(query))
			print("{:.2f},{},{}".format(i / 100, full, partial), file=out)
			print("Finished {}".format(i))
	
with open(os.path.join(output_folder, "MapWeightsAll.csv"), "w+") as out:
	for i in range(1, 201):
		partial = 0
		full = 0
		partial = parse_file(os.path.join(directory, "PartiallyRelevant{}.txt".format(i)), "map", "all")
		full = parse_file(os.path.join(directory, "Relevant{}.txt".format(i)), "map", "all")
		print("{:.2f},{},{}".format(i / 100, full, partial), file=out)
		print("Finished {}".format(i))


with open(os.path.join(output_folder, "BprefWeightsAll.csv"), "w+") as out:
	for i in range(1, 201):
		partial = 0
		full = 0
		partial = parse_file(os.path.join(directory, "PartiallyRelevant{}.txt".format(i)), "bpref", "all")
		full = parse_file(os.path.join(directory, "Relevant{}.txt".format(i)), "bpref", "all")
		print("{:.2f},{},{}".format(i / 100, full, partial), file=out)
		print("Finished {}".format(i))
