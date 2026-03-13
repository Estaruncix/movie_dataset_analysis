# Since its a 200k+ dataset well only import the first bits to check the data types.
# %%
import pandas as pd

# %%t
df = pd.read_csv(r"C:\Users\RositaRos\git_practice\movie_dataset_analysis\data\movies_dataset.csv", nrows=1000) # importing sample to operate on
# %%
df = df.drop(columns=['Unnamed: 0'])  # clean up index column
# %%
print(df.head())
print(df.dtypes)
df.info()
# %%
print(df.columns)
print(df.sample(5))
print(df.isnull().sum())

# %%    
df_full = pd.read_csv(r"C:\Users\RositaRos\git_practice\movie_dataset_analysis\data\movies_dataset.csv")
df_full = df_full.drop(columns=['Unnamed: 0'])
df_full.to_csv(r"C:\Users\RositaRos\git_practice\movie_dataset_analysis\data\movies_dataset_clean.csv", index=False, encoding='utf-8-sig')

# %%
print(df_full.columns)

# Interesting for future; chunking the dataset and showing a progress bar, this section has not been used.

# %%
import pandas as pd
from tqdm import tqdm

# %%
# File paths
input_csv = r"C:\Users\RositaRos\git_practice\movie_dataset_analysis\data\movies_dataset.csv"
output_csv = r"C:\Users\RositaRos\git_practice\movie_dataset_analysis\data\movie_dataset_clean.csv"

# %%
# Read CSV in chunks and write cleaned CSV
chunks = pd.read_csv(input_csv, chunksize=50000)

# Wrap chunks with tqdm for progress bar
for i, chunk in enumerate(tqdm(chunks, desc="Processing chunks")):
    # Drop unnecessary index column
    if 'Unnamed: 0' in chunk.columns:
        chunk = chunk.drop(columns=['Unnamed: 0'])
    
    # Write mode and header
    mode = 'w' if i == 0 else 'a'
    header = i == 0
    
    # Save chunk
    chunk.to_csv(output_csv, mode=mode, header=header, index=False)

# %%
print("All chunks processed. Clean CSV is ready:", output_csv)