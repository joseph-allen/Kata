from sklearn.base import TransformerMixin
import pandas as pd

df_slurs = pd.read_csv('../data/Terms-to-Block.csv', header=None, index_col=False)
slurs_list =  df_slurs.values[0]

def count_slurs(text):
    return len(set(text.split(' ')) & set(slurs_list))


# Count Slurs
class CountSlurs(TransformerMixin):

    def fit(self, X, y=None):
        # stateless transformer
        return self

    def transform(self, X):
        # assumes X is a DataFrame
        X['slur_count'] = X['text'].apply(count_slurs)
        return X
