from sklearn.base import TransformerMixin
import re
import string


def generalize_mentions(text):
    return re.sub(r'(?<=^|(?<=[^a-zA-Z0-9-_\.]))@([A-Za-z]+[A-Za-z0-9_]+)',
                  '@twitterMention', text)


def generalize_urls(text):
    return re.sub(r'(?:http|ftp|https)://(?:[\w_-]+(?:(?:\.[\w_-]+)+))(?:[\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?',
                  'urlRemoved', text)


def scrub_punctuation(text):
    return text.translate(None, string.punctuation)


# Generalize Tweet mentions
class GeneralizeMentions(TransformerMixin):

    def fit(self, X, y=None):
        # stateless transformer
        return self

    def transform(self, X):
        # assumes X is a DataFrame
        X['text'] = X['text'].apply(generalize_mentions)
        return X


# Generalize URLS
class GeneralizeURL(TransformerMixin):

    def fit(self, X, y=None):
        # stateless transformer
        return self

    def transform(self, X):
        # assumes X is a DataFrame
        X['text'] = X['text'].apply(generalize_urls)
        return X


# scrub punctuation
class ScrubPunctuation(TransformerMixin):

    def fit(self, X, y=None):
        # stateless transformer
        return self

    def transform(self, X):
        # assumes X is a DataFrame
        X['text'] = X['text'].apply(scrub_punctuation)
        return X
