# BH-Task
Solve the following:
* What are the current conversion rates by source?
* Is it possible to predict whether a customer is going to make a purchase?
* What are the most important factors driving conversion?
* What should we do next?
Python version : 3.6.4
Linting : flake8

## Sample Data
| country       | age           | new_user      | source        | total_pages_visited | converted |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
|USA|35|1|Ads|4.0|0 |
|China|25|1|Direct|5.0|1|

## File Structure

```
├── README.md          <- The top-level README for developers using this project.
|
├── data
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── notebooks          <- Jupyter notebooks.
│                         
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│
├── requirements.txt   <- The requirements folder
|   |── common.txt     <- shared pip packages, pip freeze > requirements/common.txt
│   │── dev.txt        <- dev only packages, pip freeze > requirements/dev.txt
|   └── prod.txt       <- prod only packages, pip freeze > requirements/prod.txt
│
├── src                <- Source code for use in this 
```

## Getting Started

look in the notebooks folder to find the exploration notebook where I initially explored the data, and the model notebook where I breifly investigate modelling.

running install sets up pre-commit tests