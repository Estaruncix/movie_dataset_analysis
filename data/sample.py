import pandas as pd
df_full = pd.read_csv(r"C:\Users\RositaRos\git_practice\movie_dataset_analysis\data\movies_dataset.csv",nrows = 1000)
df_full = df_full.drop(columns=['Unnamed: 0'])
df_full.to_csv(r"C:\Users\RositaRos\git_practice\movie_dataset_analysis\data\movies_dataset_sample.csv", index=False, encoding='utf-8-sig')
