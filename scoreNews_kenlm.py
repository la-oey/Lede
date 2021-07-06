import time
import csv
import kenlm
model = kenlm.Model('kenlm/lm/test.arpa')
print(model.score('this is a sentence .', bos = True, eos = True))

def main():
	start_time = time.time()
	with open('News.csv') as file:
		reader = csv.DictReader(file)

		score_file = open('scoredTitles.csv', 'w')
		fieldnames = ['title', 'subject', 'date', 'type', 'score']
		writer = csv.DictWriter(score_file, fieldnames = fieldnames)
		writer.writeheader()

		for r in reader:
			score = model.score(r['title'], bos = True, eos = True)
			rowinput = {'title':r['title'], 'subject':r['subject'], 'date':r['date'], 'type':r['type'], 'score':score}
			writer.writerow(rowinput)
		file.close()
		score_file.close()
	print("scoreNews_kenlm.py Run Time: " + str(time.time()-start_time) + " seconds")

main()