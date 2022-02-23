# tc-codesum

This repository provides the code necessary to 
reproduce the results found in the paper
["Análise Experimental de Abordagens para Sumarização de Código Fonte"](https://github.com/gpfl/tc-codesum/tree/master/pdf/Flores_G_Analise_Experimental.pdf).

### Table of Contents
* [Data](https://github.com/gpfl/tc-codesum#Data)
* [RNN](https://github.com/gpfl/tc-codesum#RNN)
* [NeuralCodeSum](https://github.com/gpfl/tc-codesum#NeuralCodeSum)
* [CodeBERT](https://github.com/gpfl/tc-codesum#CodeBERT)

# Data

For training, we used a subset of 500K code and summarization pairs from 
the [CoDesc](https://github.com/csebuetnlp/CoDesc) dataset for code summarization, 
which can be downloaded [here](https://drive.google.com/file/d/1pH51Ttn440keobIvDbk2KAZ7t3he1Wyw/view?usp=sharing).

    # Requirements: zip and gdown (Google Drive files)
    pip install zip gdown
    
    # Download the data
    gdown https://drive.google.com/uc?id=1pH51Ttn440keobIvDbk2KAZ7t3he1Wyw
    
    # Unpack & remove zip
    unzip codesummarization.zip -d data/
    rm codesummarization.zip

# RNN

# NeuralCodeSum

# CodeBERT
