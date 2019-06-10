from sklearn.base import TransformerMixin
from sklearn.base import BaseEstimator, TransformerMixin
import pandas as pd

class BooleanFilter(TransformerMixin):
  def transform(X, **kwargs):
    print(type(X))
    pass
    
  def fit(X, y=None, **kwargs):
    return self

class DataFrameColumnSelector(BaseEstimator, TransformerMixin):
    """
    Transformer class to select a single column from a pandas dataframe
    """
    def __init__(self, attribute_names):
        self.attribute_names = attribute_names

    def fit(self, X, y=None):
        return self

    def transform(self, X):
        return X[self.attribute_names].values.reshape(-1, 1)