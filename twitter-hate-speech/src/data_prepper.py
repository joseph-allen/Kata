import pandas as pd
from pipelines.preprocessing import ColumnExtractor, ColumnReLabeler
from pipelines.tweet_cleaning import GeneralizeMentions, GeneralizeURL, ScrubPunctuation
from pipelines.count_slurs import  CountSlurs
from pipelines.sentiment import PosSentiment, NegSentiment, NeuSentiment, CompoundSentiment
from sklearn.pipeline import Pipeline


def main():
    # Read in data
    df = pd.read_csv('../data/data-labeled.csv')

    # Features to select
    CAT_FEATS = [
        'tweet_text', 'Label',
    ]
    COL_LABELS = [
        'text', 'label'
    ]

    # Preprocessing with a Pipeline
    data_pipepline = Pipeline([
        ('categoricals', Pipeline([
            ('extract', ColumnExtractor(CAT_FEATS)),
            ('rename', ColumnReLabeler(COL_LABELS)),
            ('generalize_mentions', GeneralizeMentions()),
            ('generalize_url', GeneralizeURL()),
            ('scrub_punctuation', ScrubPunctuation()),
            ('count_slurs', CountSlurs()),
            ('positive_sentiment', PosSentiment()),
            ('negative_sentiment', NegSentiment()),
            ('neutral_sentiment', NeuSentiment()),
            ('compound_sentiment', CompoundSentiment()),
        ])),
    ])

    # clean data with data pipeline
    df = data_pipepline.fit_transform(df)
    df.to_csv('../data/processed/labled_data.csv', encoding='utf-8', index=False)


if __name__ == "__main__":
    main()
