import csv
import os

inputFile = os.path.join(os.environ['READ_DIR'], 'characters.csv')
outputFile = os.path.join(os.environ['WRITE_DIR'], 'words.txt')

outputString = ''
with open(inputFile) as inputFileContent:
    csvContent = csv.reader(inputFileContent, delimiter=',', quotechar='"')
    for row in csvContent:
        for cellValue in row:
            outputString += cellValue
        outputString += ' '

with open(outputFile, 'w') as outputFileContent:
    outputFileContent.write(outputString)

print('File processed!')
