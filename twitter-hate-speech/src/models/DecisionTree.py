from sklearn.cross_validation import train_test_split
from sklearn import tree
from sklearn.metrics import accuracy_score
from sklearn.metrics import confusion_matrix
import pandas as pd
from sklearn import metrics


def split_X_Y(df):
    X = df.loc[:, (df.columns != 'label') & (df.columns != 'text')].as_matrix()
    Y = df['label'].as_matrix()
    return X, Y


def main():
    # Read in data
    df = pd.read_csv('../../data/processed/labeled_data.csv')
    print(df.head())
    # Split test/train data
    train, test = train_test_split(df)

    # Split into X and Y
    train_X, train_Y = split_X_Y(train)
    test_X, test_Y = split_X_Y(test)

    # train Decision tree
    clf = tree.DecisionTreeClassifier(criterion="gini", max_features='sqrt', min_samples_leaf=100, splitter="best")
    clf = clf.fit(train_X, train_Y)

    # make predictions
    pred_Y = clf.predict(test_X)

    # print accuracy
    print('Accuracy: {}'.format(accuracy_score(test_Y, pred_Y)))

if __name__ == "__main__":
    main()
