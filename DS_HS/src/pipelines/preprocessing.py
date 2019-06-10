from sklearn.base import TransformerMixin


# extracts columns passed in as array
class ColumnExtractor(TransformerMixin):

    def __init__(self, cols):
        self.cols = cols

    def fit(self, X, y=None):
        # stateless transformer
        return self

    def transform(self, X):
        # assumes X is a DataFrame
        Xcols = X[self.cols]
        return Xcols


class ColumnReLabeler(TransformerMixin):
    def __init__(self, col_labels):
        self.col_labels = col_labels

    def fit(self, X, y=None):
        # stateless transformer
        return self

    def transform(self, X):
        # Assumes X is a DataFrame
        X.columns = self.col_labels
        return X
