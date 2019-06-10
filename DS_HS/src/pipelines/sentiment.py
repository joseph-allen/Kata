import nltk
nltk.download('vader_lexicon')
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from sklearn.base import TransformerMixin


sid = SentimentIntensityAnalyzer()

def get_polarity(key, string):
    ss = sid.polarity_scores(string)
    return ss[key]


# Positive Sentiment
class PosSentiment(TransformerMixin):

    def fit(self, X, y=None):
        # stateless transformer
        return self

    def transform(self, X):
        # assumes X is a DataFrame
        X['pos_score'] = X['text'].apply(
            lambda string: get_polarity('pos', string)
        )
        return X


# Negative Sentiment
class NegSentiment(TransformerMixin):

    def fit(self, X, y=None):
        # stateless transformer
        return self

    def transform(self, X):
        # assumes X is a DataFrame
        X['neg_score'] = X['text'].apply(
            lambda string: get_polarity('neg', string)
        )
        return X


# Neutral Sentiment
class NeuSentiment(TransformerMixin):

    def fit(self, X, y=None):
        # stateless transformer
        return self

    def transform(self, X):
        # assumes X is a DataFrame
        X['neu_score'] = X['text'].apply(
            lambda string: get_polarity('neu', string)
        )
        return X


# Compound Sentiment
class CompoundSentiment(TransformerMixin):

    def fit(self, X, y=None):
        # stateless transformer
        return self

    def transform(self, X):
        # assumes X is a DataFrame
        X['compound_score'] = X['text'].apply(
            lambda string: get_polarity('compound', string)
        )
        return X
