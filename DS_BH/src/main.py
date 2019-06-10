import numpy as np
import pandas as pd
from sklearn.pipeline import Pipeline
from preprocessing.filter import DataFrameColumnSelector
from sklearn.model_selection import train_test_split

def main():

    df = pd.read_csv('data/my_data/raw/raw.csv')

    train_X = df.drop(columns=['converted'])
    train_y = df.converted

    pipeline = Pipeline([
        ('selector', DataFrameColumnSelector(['country'])),
    ])

    print(pd.DataFrame(pipeline.transform(train_X)).head())

    print('done')

if __name__ == '__main__':
    main()

# sklearn pipeline needs to
# dummy encode source (label binarizer)
# dummy encode country (label binarizer)
# remove unlabeled feature