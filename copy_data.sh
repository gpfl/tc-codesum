#!/bin/bash
CODESC_DATA=data/codesummarization_data
NCS_DATA=NeuralCodeSum/data/java

cp $CODESC_DATA/train_small/code.original_subtoken $NCS_DATA/train/code.original_subtoken
cp $CODESC_DATA/train_small/javadoc.original $NCS_DATA/train/javadoc.original

cp $CODESC_DATA/dev/code.original_subtoken $NCS_DATA/dev/code.original_subtoken
cp $CODESC_DATA/dev/javadoc.original $NCS_DATA/dev/javadoc.original

cp $CODESC_DATA/test/code.original_subtoken $NCS_DATA/test/code.original_subtoken
cp $CODESC_DATA/test/javadoc.original $NCS_DATA/test/javadoc.original
