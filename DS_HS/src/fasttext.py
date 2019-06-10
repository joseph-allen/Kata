import pandas as pd


def main():
    # Read in data
    df = pd.read_csv('../data/processed/labeled_data.csv')

    df = df[['label', 'text']]
    df['label'] = df['label'].apply(fastTextLabel)
    df["fasttext"] = df["label"].map(str) + df["text"]
    print(df.head())
    df['fasttext'].to_csv('../data/processed/fasttext_data.csv', encoding='utf-8', index=False)


def fastTextLabel(label):
    return '__label__' + label + ' '

if __name__ == "__main__":
    main()
