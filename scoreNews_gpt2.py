import lm_scorer.models.auto
from lm_scorer.models.auto import AutoLMScorer
scorer = AutoLMScorer.from_pretrained("gpt2-large")

def score(sentence):
    return scorer.sentence_score(sentence)
print(score('this is a sentence .'))