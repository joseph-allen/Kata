# Twitter Hate Speech
A classification of Tweets into hate speech/insulting language/neutral language.
Python Version: 2.7.13
Linting: flake8


## Getting Started
The interesting findings here are located in `reports/Tweet_Classification.pdf` and there is a Jupyter notebook exploring data in `notebooks/exploration.html`.


```
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│
│
├── requirements.txt   <- The requirements folder
|   |── common.txt     <- shared pip packages, pip freeze > requirements/common.txt
│   │── dev.txt        <- dev only packages, pip freeze > requirements/dev.txt
|   └── prod.txt       <- prod only packages, pip freeze > requirements/prod.txt
│
├── src                <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   │
│   │
│   ├── models         <- Scripts to train models and then use trained models to make
│       │                 predictions
│       ├── predict_model.py
│       └── train_model.py
```

## Benchmark
Accuracy: 0.72

