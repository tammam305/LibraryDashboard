#!"C:\Users\-\AppData\Local\Programs\Python\Python36-32\python"
print('Content-Type: text/html')
print()

import cgitb
import sys
import os
#to handel import error when run this script from php
cgitb.enable()
os.environ['APPDATA'] = os.environ['APPDATA'] if 'APDATA' in os.environ else 'C:\\Users\\-\\AppData\\Roaming'

import tweepy
import csv
import pandas as pd
import pymysql
import re , nltk
#from nltk import ngrams
from nltk.stem import WordNetLemmatizer
from nltk.corpus import stopwords
import collections
import sys

import numpy as np
from scipy.sparse import hstack
from sklearn.feature_extraction.text import CountVectorizer

from sklearn.model_selection import train_test_split

from sklearn import svm
from sklearn.multiclass import OneVsRestClassifier

from wordcloud import WordCloud
from PIL import Image
from sklearn.externals import joblib

conn = pymysql.connect(host='127.0.0.1', user = 'pma', password = '', db = 'gp')
db_conn = conn.cursor()
####input your credentials here
consumer_key = 'j9mFgv8fLA8ttEplIV9ZmEWFC'
consumer_secret = 'TA85GOBbsFoq5HJEacVtb5e1z6hffhSXQviff5MPKeh2dMMf02'
access_token = '957905431929618432-nv0dgXdrsUI1mHV8bTBdXiTTWta0kzH'
access_token_secret = '2GPHmEBvBKk9meYXVeDyZd3Eaztpl9ueYNzdVa5K24o83'

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth,wait_on_rate_limit=True)


# Open/Create a file to append data
header = ["tweet_id", "airline_name", "tweet_text", "date", "hashtags", "likes"]
csvFile = open('LiveTweets.csv', 'w', newline='', encoding="utf-8")
#Use csv Writer
csvWriter = csv.writer(csvFile, delimiter=',')
csvWriter.writerow(header)

tag_list = [["Singapore Airlines_SI", "#Singapore_Airlines OR #SingaporeAirlines OR @SingaporeAir"],
            ["Japan Airlines_JA", "#Japan_Airlines OR #JapanAirlines OR @JAL_Official_jp OR @JALFlightInfo_e"],
            ["Emirates Airlines_EM", "#Emirates_Airlines OR #EmiratesAirlines OR @emirates"],
            ["Cathay Pacifi Airlines_CAT", "#Cathay_Pacific OR #CathayPacific OR #Cathay_Pacifi_Airlines OR #CathayPacifiAirlines OR @cathaypacific"],
            ["EVA Airlines_EVA", "#EVA_Air OR #EVAAir OR #EVA_Airlines OR #EVAAirlines OR @EVAAirUS"],
            ["Etihad Airways_ET", "#Etihad_Airways OR #EtihadAirways OR @EtihadAirways OR @EtihadAirwaysAR"],
            ["Lufthansa Airline_LU", "#Lufthansa_Airline OR #LufthansaAirline OR @LufthansaFlyer"],
            ["Oman Airlines_OM", "#Oman_Air OR #OmanAir OR #Oman_Airlines OR #OmanAirlines OR @omanair"],
            ["Saudi Arabian Airlines_SAU", "#Saudi_Arabian_Airlines OR #SaudiArabianAirlines OR #Saudi_Airlines OR #SaudiAirlines OR @Saudi_Airlines"],
            ["Royal Air Maroc_MAR", "#Royal_Air_Maroc OR #Royal_Maroc_Airlines OR #RoyalAirMaroc OR #RoyalMarocAirlines OR @RAM_Maroc"]
           ]
#Filter tweets recevid from twitter
def filter_location(tweet, airline_name):
    
    ksa_reg = ['saudi','SA', 'السعودية', 'riyadh', 'makkah', 'kharj', 'dawasir', 'mecca', 'jeddah', 'taif', 'medina', 'madinah', 'qassim',
              'dammam', 'ahsa', 'batin', 'jubail', 'khobar', 'khafji', 'asir', 'jawf', 'bahah', 'najran', 'jizan', 'hail', 'tabuk',
              '🇸🇦','jeedah', 'dmm', 'saudia', 'sa', 'jed', 'alkharj',
               'الباحة', 'ksa', 'الخرج', 'الشرقية', 'تنومة', 'الخفجي', 'القصيم', 'بريدة', 'الطائف', 'الاحساء', 'الثقبة', 'نجران', 
               'الدمام', 'السعوديه', 'المدينة', 'حايل', 'السعودي', 'عنيزة', 'جازان', 'الجبيل', 'مكة', 'جدة', 'السعود', 'الرياض','الخبر']
    if tweet.geo:
        return True
    elif tweet.place:
        if str(tweet.place).split('\',')[5][15:] == 'SA':
            return True
        elif str(tweet.place).split('\',')[5][15:] == 'KW':
            return True
        elif str(tweet.place).split('\',')[5][15:] == 'AE':
            return True
        elif str(tweet.place).split('\',')[5][15:] == 'QA':
            return True
        elif str(tweet.place).split('\',')[5][15:] == 'BH':
            return True
        elif str(tweet.place).split('\',')[5][15:] == 'OM':
            return True
    elif tweet.user.location:
            if set(ksa_reg).intersection(set([s.lower() for s in re.sub('[^a-zA-Zأ-ي]', ' ', tweet.user.location).split()])):
                return True
            elif set(['kuwait', 'kw', 'الكويت']).intersection(set([s.lower() for s in re.sub('[^a-zA-Zأ-ي]', ' ', tweet.user.location).split()])):
                return True
            elif set(['emirates', 'emiratos', 'ae', 'abudhabi', 'dhabi', 'dubai', 'أبوظبي', 'دبـي', 'uae', 'الامارات']).intersection(set([s.lower() for s in re.sub('[^a-zA-Zأ-ي]', ' ', tweet.user.location).split()])):
                return True
            elif set(['qatar','qa', 'doha', 'قطر']).intersection(set([s.lower() for s in re.sub('[^a-zA-Zأ-ي]', ' ', tweet.user.location).split()])):
                return True
            elif set(['bahrain','bh', 'البحرين']).intersection(set([s.lower() for s in re.sub('[^a-zA-Zأ-ي]', ' ', tweet.user.location).split()])):
                return True
            elif set(['oman','om', 'عمان']).intersection(set([s.lower() for s in re.sub('[^a-zA-Zأ-ي]', ' ', tweet.user.location).split()])):
                return True
    elif airline_name in ['Emirates Airlines_EM', 'Oman Airlines_OM', 'Saudi Arabian Airlines_SAU', 'Etihad Airways_ET']:
            return True
    return False

#read tweets from twitter
for index in list(map(int, sys.argv[1:])):
    for tweet in tweepy.Cursor(api.search,q= tag_list[index][1], 
                               tweet_mode='extended',
                               count=10000,
                               lang="en",
                               geocode="24.488370,45.922187,1200km",
                               since="2006-04-03").items():
        
        hashtags = [h['text'] for h in tweet.entities['hashtags']]
        if filter_location(tweet, tag_list[index][0]):
            csvWriter.writerow([tweet.id_str, tag_list[index][0], tweet.full_text, tweet.created_at,
                            ', '.join(hashtags), tweet.favorite_count])
        sql_query="INSERT INTO `KSA_Dataset` VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s);"
        sql_data = (tweet.id_str, tag_list[index][0], tweet.full_text, tweet.created_at, ', '.join(hashtags), tweet.favorite_count, str(tweet.user.location), str(tweet.geo), str(tweet.place))                                                                                               
        try:
            db_conn.execute(sql_query, sql_data)
        except pymysql.IntegrityError as e:
            print("Tweet doesn't inserted to Database.",e.args)
            
        conn.commit()
csvFile.close()
print("retrive data from twitter sucessfully.")

##read dataset and 
tweets = pd.read_csv("Tweets.csv")
file = open("stopwords.txt")
stop_words = set(stopwords.words('english')).union(set(file.read().split("\n")))
wordnet_lemmatizer = WordNetLemmatizer()

#normalizing
def normalizer(tweet):
    letters = re.sub("[^a-zA-Z]"," ",tweet)
    tokens = nltk.word_tokenize(letters)    
    lower_case = [l.lower() for l in tokens]
    filtered_tweet = list(filter(lambda l:l not in stop_words, lower_case))
    lemmas = [wordnet_lemmatizer.lemmatize(t) for t in filtered_tweet]
    return lemmas

tweets['normalized_tweet'] = tweets.text.apply(normalizer)



def ngrams(input_list):
    bigrams = [' '.join(t) for t in list(zip(input_list, input_list[1:]))]
    trigrams = [' '.join(t) for t in list(zip(input_list, input_list[1:], input_list[2:]))]
    return bigrams+trigrams

tweets['grams'] = tweets.normalized_tweet.apply(ngrams)


def count_words(input):
    counter = collections.Counter()
    for row in input:
        for word in row:
            counter[word] += 1
            
        
    return counter


count_vectorizer = CountVectorizer(ngram_range=(1, 2))

vectorized_data = count_vectorizer.fit_transform(tweets.text)
indexed_data = hstack((np.array(range(0, vectorized_data.shape[0]))[ : , None], vectorized_data))

def sentiment2target(sentiment):
    return {
        "negative" : -1,
        "neutral" : 0,
        "positive" : 1
    }[sentiment]

targets = tweets.airline_sentiment.apply(sentiment2target)


data_train, data_test, targets_train, targets_test = train_test_split(indexed_data, targets, test_size=0.4, random_state=0)
data_train_index = data_train[:,0]
data_train = data_train[:, 1:]
data_test_index = data_test[:,0]
data_test = data_test[:, 1:]

try:
    clf = joblib.load('gp.joblib') 
except (KeyError, FileNotFoundError) as e:
    clf = False
    print(e.args)

if not clf:
    clf = OneVsRestClassifier(svm.SVC(gamma=0.01, C=100., probability=True, class_weight='balanced', kernel="linear"))
    clf_output = clf.fit(data_train, targets_train)
    joblib.dump(clf, 'gp.joblib')

print("accuracy of linear kernel is: ")
model_accuracy = clf.score(data_test, targets_test)
print(model_accuracy)

liveTweets = pd.read_csv("LiveTweets.csv", encoding="utf-8")
sent = count_vectorizer.transform(liveTweets.tweet_text)
liveTweets['sentiment'] = clf.predict(sent)
liveTweets_proba = clf.predict_proba(sent)
liveTweets['negative'], liveTweets['nutral'], liveTweets['postive'] = liveTweets_proba[:,[0]], liveTweets_proba[:,[1]], liveTweets_proba[:,[2]],  
liveTweets[['tweet_text','sentiment','negative', 'nutral', 'postive']].head(20)

#insert statistical data to database
liveTweets['normalized_tweet'] = liveTweets.tweet_text.apply(normalizer)
liveTweets['grams'] = liveTweets.normalized_tweet.apply(ngrams)
liveTweets[['tweet_text','normalized_tweet', 'grams']].head()
print("predect sentimental values for new tweets.")

cloud_image = "img/circle_mask.png"
mask1 = np.array(Image.open(cloud_image))
text = " ".join(tw for tw in liveTweets["tweet_text"])
wordcloud = WordCloud(max_font_size=50, max_words=1000, stopwords=stop_words, background_color="white", mask=mask1, colormap='brg_r').generate(text)
wordcloud.to_file("img/first_review.png")
print("finsh word cloud.")

statis = liveTweets.groupby(['sentiment']).size()
no_positive = statis[1] if 1 in statis else 0
no_negative = statis[-1] if -1 in statis else 0
no_nutreal = statis[0] if 0 in statis else 0
no_tweets = liveTweets["tweet_id"].count()
db_conn.execute("DELETE FROM `tweet`;")
conn.commit()
db_conn.execute("DELETE FROM `analysisinfo`;")
conn.commit()
sql_query = 'INSERT INTO `analysisinfo` (`id`, `no_tweets`, `No_airlines`, `no_positive_tweets`, `no_nutreal_tweets`, `no_Negative_tweets`, `model_accuracy`) VALUES(%s,%s,%s,%s,%s,%s,%s);'
sql_data = (1, int(no_tweets), len(sys.argv[1:]), float(no_positive), float(no_nutreal), float(no_negative), float(model_accuracy))
try:
    db_conn.execute(sql_query, sql_data)
except pymysql.IntegrityError as e:
    print("Tweet doesn't inserted to Database.",e.args)
conn.commit()

sql_query = "INSERT INTO `tweet` VALUES(%s, %s, %s, %s, %s, %s, %s, %s);"
for live_tweet in liveTweets.itertuples():
    sql_data = (live_tweet.tweet_id, live_tweet.airline_name, live_tweet.tweet_text, float(live_tweet.postive), float(live_tweet.nutral), float(live_tweet.negative), 1, int(live_tweet.sentiment))
    try:
        db_conn.execute(sql_query, sql_data)
    except pymysql.IntegrityError as e:
        print("Tweet doesn't inserted to Database.",e.args)
    conn.commit()

db_conn.execute("DELETE FROM `wordinfo`;")
conn.commit()
sql_query = 'INSERT INTO `wordinfo` (`id`, `Word`, `No_Repetition`) VALUES(%s,%s,%s);'
count = 1
bag_of_words=()
for data in liveTweets[['grams']].apply(count_words)['grams'].most_common(30):
    sql_data = (count, data[0], data[1])
    count +=1
    try:
        db_conn.execute(sql_query, sql_data)
    except pymysql.IntegrityError as e:
        print("Tweet doesn't inserted to Database.",e.args)
conn.commit()
