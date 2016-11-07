# 442PianoTranscription

This code repository stores the working directory for the Piano Transcription project for EECS 442. 


TODO:

All of the CV work (lol)

Get a working interface from MATLAB to python

Make the python script more robust


The following is a manual for the product as of 11/7/16 (and there's _much_ more to do!)


To run this software, simply run the pad.bat script and use your keyboard as keys to a piano. The key mapping is defined below. When you wish to end, press the 'q' key and a pdf of your score will be shown.

Key mapping:

C C#/Db D D#/Eb E F F#/Gb G G#/Ab A A#/Bb B C

w   3   e   4   r t   6   y   7   u   8   i o 


The length of the note is dependent on how many times the key is repeatedly pressed. I.e.:
1 press   = quarter note
2 presses = half note
4 presses = whole note


Notes: 
1.This software package currently uses a Windows Batch (.bat) script for processing (we are working on changing this). 

2.To use the auto-refreshing feature of this package, you must have a pdf viewer that allows auto-refreshing. Sumatra PDF is what we have been using

