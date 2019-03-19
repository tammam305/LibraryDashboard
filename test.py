import sys
from nltk.corpus import stopwords

print("This is script %s" %sys.argv[0])
print("arguments are %s"%sys.argv[1:])
print(stopwords.words("english"))
