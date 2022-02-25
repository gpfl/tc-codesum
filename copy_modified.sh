#!/bin/bash
MOD_PATH=files/mod
SCRIPT_PATH=NeuralCodeSum/scripts/java
BEAM_PATH=NeuralCodeSum/c2nl/translator

cp $MOD_PATH/beam.py $BEAM_PATH
cp $MOD_PATH/{transformer,rnn}.sh $SCRIPT_PATH
