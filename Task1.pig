lines = LOAD '/home/acadgild/WordFile.txt' AS (line:chararray);
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line)) as word;
grp = GROUP words BY word;
wrdcnt = FOREACH grp GENERATE group, COUNT(words);
DUMP wrdcnt;

