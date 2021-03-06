# tc-codesum

This repository provides the code necessary to 
reproduce the results found in the paper
["Análise Experimental de Abordagens para Sumarização de Código Fonte"](https://github.com/gpfl/tc-codesum/tree/master/files/pdf/Flores_G_Analise_Experimental.pdf)
(Experimental Analysis of Code Summarization Approaches).
<p align="center">
  <img src="https://github.com/gpfl/tc-codesum/blob/master/files/img/tc-codesum.png?raw=true" width="500" alt="Code Summarization Example"/>
</p>

### Table of Contents
* [Data](https://github.com/gpfl/tc-codesum#Data)
* [CodeBERT](https://github.com/gpfl/tc-codesum#CodeBERT)
  * [Preparation](https://github.com/gpfl/tc-codesum#preparation)
  * [Training & Eval](https://github.com/gpfl/tc-codesum#training--eval)
  * [Testing](https://github.com/gpfl/tc-codesum#testing)
* [NeuralCodeSum](https://github.com/gpfl/tc-codesum#NeuralCodeSum)
  * [Preparation](https://github.com/gpfl/tc-codesum#preparation-1)
  * [Training, Testing & Beam Search](https://github.com/gpfl/tc-codesum#training-testing--beam-search)
    * [NeuralCodeSum](https://github.com/gpfl/tc-codesum#NeuralCodeSum-1)
    * [RNN](https://github.com/gpfl/tc-codesum#rnn)

# Data

For training, we used a subset of 500K code and summarization pairs from 
the [CoDesc](https://github.com/csebuetnlp/CoDesc) dataset for code summarization, 
which can be downloaded [here](https://drive.google.com/file/d/1pH51Ttn440keobIvDbk2KAZ7t3he1Wyw/view?usp=sharing).
    
```python
# Requirements: zip and gdown (Google Drive files)
pip install zip gdown

# Download the data
gdown https://drive.google.com/uc?id=1pH51Ttn440keobIvDbk2KAZ7t3he1Wyw

# Unpack & remove zip
unzip codesummarization.zip -d data/
rm codesummarization.zip
```

# CodeBERT
### Preparation

```python
# Requirements
pip install torch==1.4.0
pip install transformers==2.5.0
pip install filelock

# Clone CodeBERT repo
git clone --depth 1 https://github.com/guoday/CodeBERT.git
```

### Training & Eval
```python
cd CodeBERT/CodeBERT/code2nl

# Parameters
lang="java" 
lr=5e-5
batch_size=16
beam_size=2
source_length=256
target_length=128
data_dir=$(pwd)
output_dir=$data_dir/CodeBERT/CodeBERT/code2nl/model
train_file=$data_dir/data/codesummarization_data/train_small/train_small.jsonl
dev_file=$data_dir/data/codesummarization_data/dev/dev.jsonl
eval_steps=10 
train_steps=10 
pretrained_model=microsoft/codebert-base 

# Run Model
python run.py --do_train --do_eval \
--model_type roberta \
--model_name_or_path $pretrained_model \
--train_filename $train_file \
--dev_filename $dev_file \
--output_dir $output_dir \
--max_source_length $source_length \
--max_target_length $target_length \
--beam_size $beam_size \
--train_batch_size $batch_size \
--eval_batch_size $batch_size \
--learning_rate $lr \
--train_steps $train_steps \
--eval_steps $eval_steps
```

### Testing
```python
cd CodeBERT/CodeBERT/code2nl

# Parameters
lang="java" 
beam_size=5
batch_size=32
source_length=256
target_length=128
data_dir=$(pwd)
output_dir=$data_dir/CodeBERT/CodeBERT/code2nl/model
dev_file=$data_dir/data/codesummarization_data/dev/dev.jsonl
test_file=$data_dir/data/codesummarization_data/test/test.jsonl
test_model=$data_dir/CodeBERT/CodeBERT/code2nl/model/pytorch_model.bin

# Run Model
python run.py --do_test \
--model_type roberta \
--model_name_or_path microsoft/codebert-base \
--load_model_path $test_model \
--dev_filename $dev_file \
--test_filename $test_file \
--output_dir $output_dir \
--max_source_length $source_length \
--max_target_length $target_length \
--beam_size $beam_size \
--eval_batch_size $batch_size
```

# NeuralCodeSum

### Preparation
```python
# Clone the repository
git clone --depth 1 https://github.com/wasiahmad/NeuralCodeSum.git

# Install requirements
cd NeuralCodeSum
pip install -r requirements.txt
python setup.py develop

# Copy data files
bash copy_data.sh

# Copy files that we modified to run the models 
bash copy_modified.sh
```

### Training, Testing & Beam Search

### NeuralCodeSum
```python
cd NeuralCodeSum/scripts/java

# Run Model
bash transformer.sh 0 code2jdoc
```

### RNN
```python
cd NeuralCodeSum/scripts/java

# Run Model
bash rnn.sh 0 rnn
```
