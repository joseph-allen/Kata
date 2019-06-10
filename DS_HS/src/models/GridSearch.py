from sklearn.cross_validation import train_test_split
from sklearn import tree
from sklearn.metrics import accuracy_score
from sklearn.metrics import confusion_matrix
import pandas as pd
from sklearn import metrics
from sklearn.model_selection import GridSearchCV


def split_X_Y(df):
    X = df.loc[:, (df.columns != 'label') & (df.columns != 'text')].as_matrix()
    Y = df['label'].as_matrix()
    return X, Y


def main():
    # Read in data
    df = pd.read_csv('../../data/processed/labeled_data.csv')

    # Split test/train data
    train, test = train_test_split(df)

    # Split into X and Y
    train_X, train_Y = split_X_Y(train)
    test_X, test_Y = split_X_Y(test)

    parameters = {
        'criterion': ('gini', 'entropy'),
        'splitter': ('best', 'random'),
        'min_samples_split': [2, 100],
        'min_samples_leaf': [1, 100],
        'max_features': ('auto', 'sqrt', 'log2'),
        'max_leaf_nodes': [2, 100]
    }

    # train Decision tree
    clf = tree.DecisionTreeClassifier()
    clf = GridSearchCV(clf, parameters)
    clf = clf.fit(train_X, train_Y)

    print(sorted(clf.cv_results_.keys()))
    print(clf.best_estimator_.get_params())

if __name__ == "__main__":
    main()
