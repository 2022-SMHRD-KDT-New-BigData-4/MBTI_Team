#!/usr/bin/env python
# coding: utf-8

# 
# ### 빵형의 음원추천 알고리즘 정리용 페이지
#  
#  GTZAN dataset : https://www.kaggle.com/datasets/andradaolteanu/gtzan-dataset-music-genre-classification
#  기반으로 삼은 코드 : https://www.kaggle.com/andradaolteanu/work-w-audio-data-visualise-classify-recommend

# ### 데이터셋 다운로드 파트
#     우리한테는 그렇게까지 필요없다고 생각하는 부분.
#     why? 직접 받아온 데이터를 기반으로 업데이트 해야하기 때문
# 
# - 케글과 연동하기
# import os
# os.environ['KAGGLE_USERNAME'] = '너꺼 케글 아이디'
# os.environ['KAGGLE_KEY'] = '케글 setting들어가서 token발급 받으면 제공받는 토큰값'
# 
# - 케글에 제공되어진 폴더 다운로드 받기
# !kaggle datasets download -d andradaolteanu/gtzan-dataset-music-genre-classification
# - 다운받은 폴더 압축 풀어주는 로직
# !unzip -q gtzan-dataset-music-genre-classification.zip
# 
# ** 데이터 폴더 안에 저장된 친구들
# 1. genres_original : 임의로 구성된 10개의 장르별 폴더 -> .wav 웨이브 형태의 음원 파일
# 2. img_original : 동일하게 구성된 10개의 장르별 폴더 - 각 음원들의 멜스펙토그램 사진
# 3. 30초 단위의 오디오 feature 분석한 csv파일
# 4. 3초 단위의 상기 동일한 csv파일
# 
# 일단 다운받아서 확인해보는 것이 좋겠다고 생각이 듭니다~

# In[ ]:


# 상기 로직 작성해보는 칸


# ### 오디오 파일 이해하기!
# (프로젝트 연관성을 없지만 기본적으로 라이브러리는 설치해야 함)
# 
# - y: 소리가 떨리는 세기(진폭)를 시간 순서대로 나열한 것
# - Sampling rate(sr) : 1초당 샘플의 개수, 단위 Hz 도는 kHz
# 
# librosa 라는 라이브러리를 사용한다는 듯
# 
# librosa 설치하기
#     !pip install librosa
#     import librosa
# 
# 하고 시작해봅시다 우리

# In[ ]:


import librosa

y, sr = librosa.load('음원파일.wav')

print(y)              # 음악을 숫자로 읽어오는 것
print(len(y))         # 음악을 숫자로 바꾼 후 길이
print('Sampling rate (kHz): %d' % sr)   
print('Audio length (seconds): %.2f' % (len(y) / sr))     # 오디오가 몇초 짜리인지 알 수 있는 로직


# 파이썬에서 음악을 들어봅시다.
#     IPython.display 라는 라이브러리를 통해 가능하다고 합니다.

# In[ ]:


import IPython as ipd

ipd.Audio(y, rate=sr)


# 2D 음파 그래프 - pyplot으로 그려집니다.
# (프로젝트 연관성 거의 없는듯?)
# 
# 필요한 라이브러리
# matplotlib.pyplot by plt
# librosa.display
# 가 있습니다.

# In[5]:


import matplotlib.pyplot as plt
import librosa.display

plt.figure(figsize=(16,6))         
librosa.display.waveplot(y=y, sr=sr)
#이 친구를 통해서 그래프를 보여줄 수 있다고 합니다. 가로=시간, y축=오디오 세기
plt.show()


# Fourier Transform
#     - 시간영역 데이터를 주파수 영역으로 변경하는 작업
#     - y축 : 주파수 (로그 스케일)
#     - color축 : 데시벨 (진폭)
#     
# 음원 분석을 보다 용이하게 만드는 작업이라고 합니다.
# 다만 여기서 만들어진 그래프를 보고 이해하기는 많이 어렵다고 합니다.

# In[ ]:


import numpy as np

D = np.abs(librosa.stft(y, n_fft=2048, hop_length=512)) 
#librosa.stft 를 통해서 변환을 하고 n_fft 는 윈도우 사이즈?? 라고 하네요 ㅎㅎ;;

print(D.shape)

plt.figure(figsize=(16,6))
plt.plot(D)
plt.show()


# Spectogram
#     - 시간에 따른 신호 주파수의 스팩트럼 그래프
#     - 다른 이름 : Sonographs, Voiceprints, Voicegrams

# In[ ]:


DB = librosa.amplitude_to_db(D, ref=np.max)   # D = 데시벨을 의미.

plt.figure(figsize(16,6))
librosa.display.specshow(DB, sr=sr, hop_length=512, x_axis='time', y_axis='log')
plt.colorbar()
plt.show()

# 보다 정론된 데이터 그래프가 나오지만 여전히 인간히 알아보기 어렵다.


# ### Mel Spectogram 만들기
# Mel Spectogram
#     (인간이 이해하기 힘든) Spectogram의 y축을 Mel Scale로 변환한 것 (Non-linear transformation)
#     Mel Scale : https://newsight.tistory.com/294 
#     주소로 들어가면 음성인식에 관련된 기초에 대해서 알 수 있습니다.
#     
#     -> 즉 log 스케일이고 인간이 이해할 수 있는 진폭형 데이터를 보여준다는 의미.

# In[ ]:


S = librosa.featire.melspectrogram(y, sr=sr)  # 안되면 melspectogram으로 바꿔주세요.
S_DB = librosa.amplitude_to_db(S, ref=np.max)

plt.figure(figsize=(16,6))
librosa.display.specshow(S_DB, sr=sr, hop_length=512, x_axis='time', y_axis='log')
plt.colorbar()
plt.show()

# 여기서 만들어진 그래프 형태를 가장 많이 쓰인다고 합니다.


# Ex) 특정 파일 Mel Spectogram 하는 경우
#     y,sr = librosa.load('불러올 음원 파일 이름.wav')
#     y, _ = librosa.effects.trim(y)
#     여기만 다르고 아래는 동일하게 만들어서 Mel Spectogram 만들 수 있다.
#     S = librosa.featire.melspectrogram(y, sr=sr)
#     S_DB = librosa.amplitude_to_db(S, ref=np.max)
#     plt.figure(figsize=(16,6))
#     librosa.display.specshow(S_DB, sr=sr, hop_length=512, x_axis='time', y_axis='log')
#     plt.colorbar()
#     plt.show()
#     각각의 음악의 데시벨, 진폭에 따라 다르게 만들어집니다.

# ### 오디오 특성 추출하기 (Audio Feature Extraction)
# 
# (그렇게까진 필요성이 느껴지지 않는 파트.. 아래 보면 bpm구하는 방법 나와있슴다)
# 
# - bpm 정보가 없을 때 bpm이 몇인지 예측 할 수가 있습니다~
# 
# - zero crossing rate 자주 쓰인다고 합니다. 정확한 의미는 무엇일까요;;

# In[ ]:


# Tempo(BPM) 구하는 로직
tempo, _ = librosa.beat.beat_track(y, sr=sr)
print(tempo)


# In[ ]:


# Zero Crossing Rate : 음파가 양에서 음으로 or 음에서 양으로 바뀌는 비율
zero_crossings = librosa.zero_crossings(y, pad=False)

print(zero_crossings)
print(sum(zero_crossings))

# 용도에 대해서는 확실히 인지를 못하겠습니다. 특정 기간동안 몇회 crossing이 발생했는지 확인하는 방법
n0 = 9000
n1 = 9500
zero_crossings = librosa.zero_crossings(y[n0:n1], pad=False)
print(sum(zero_crossings))
# 하면 됩니다.


# Harmonic and Percussive Components
#     Harmonics : 사람의 귀로 구분할 수 없는 특징들 (음악의 색깔)
#     Percussives : 리듬과 감정을 나타내는 충격파

# In[ ]:


y_harm, y_perc = librosa.effects.hpss(y)
plt.figure(figsize=(16,6))
plt.plot(y_harm, color='b')
plt.plot(y_perc, color='r')
plt.show()

# 음악 장르를 구분하는데 사용됩니다.


# Spectral Centroid
#     - 소리를 주파수 표현했을 떄, 주파수의 가중평균을 계산하여 소리의 "무게 중심"이 어딘지를 알려주는 지표
#     - 예를 들어, 블루스 음악은 무게 중심이 가운데 부분에 놓여있는 반면, 메탈 음악은 (끝 부분에서 달리기 때문에) 노래의 마지막 부분에 무게 중심이 실립니다.

# In[ ]:


spectral_controids = librosa.feature.spectral_centroid(y,sr=sr)[0]

# Computing the time variable for visualization
frames = range(len(spectral_centroids))

# Converts frame counts to time (seconds)
t = librosa.frames_to_time(frames)

import sklearn
def normalize(x, axis='0'):
    return sklearn.preprocessing.minmax_scale(x, axis=axis)   # preprocessing 전처리 해서 0~1 사이로 나오게 하는 로직

plt.figure(figsize(16,6))
librosa.display.waveplot(y, sr=sr, alpha=0.5, color='b')
plt.plot(t, normalize(spectral_centroids), color='r')
plt.show()

# 여기서 만들어지는 그래프는 파란색은 본래의 음파 진폭?? 이런것이고
# 붉은 색은 음악의 흐름에 따라 어디에 힘이 실리는지 확인 할 수 있다.


# Spectral Rolloff
#     - 신호 모양을 측정
#     - 총 스펙트럼 에너지 중 낮은 주파수 (85% 이하) 에 얼마나 많이 집중되어 있는가를 확인 가능하다

# In[ ]:


spectral_rolloff = librosa.reature.spectral_rolloff(y, sr=sr)[0]

plt.figure(figsize =(16,6))
librosa.display.waveplot(y, sr=sr, alpha=0.5, color='b')
plt.plot(t, normalize(spectral_rolloff), color='r')
plt.show()

# 위 그래프와 비슷하게 나타나고 이것도 자주 참조가 된다고 합니다.


# ### Mel-Frequency Cepstral Coefficients(MFCCs)
# 
# 가장 중요한 특징이라고 합니다.
# 
# MFCCs는 특징들의 작은 집합(약 10~20)으로 스펙트럴 포곡선의 전체적인 모양을 축약해서 보여준다
# 사람의 청각 구조를 반영하여 음성 정보 추출
# https://tech.kakaoenterprise.com/66
# 
# 이것을 통해 ai에게 학습을 시켜주는 듯 싶습니다.

# In[ ]:


mfccs = librosa.feature.mfcc(y, sr=sr)
mfccs = normalize(mfccs, axis=1)

print('mean: %.2f' % mfccs.mean())   # mfcc의 평균값
print('var: %.2f' % mfccs.var())   # mfcc의 분산값

plt.figure(figsize=(16,6))
librosa.display.specshow(mfccs, sr=sr, x_axis='time')
plt.show()


# Chroma Frequencies
#     - 크로마 특징은 음악의 흥미롭고 강렬한 표현
#     - 크로마는 인간 청각이 옥파브 차이가 나는 주파수를 가진 두 음을 유사음으로 인지한다는 음악이론에 기반
#     - 모든 스펙트럼을 12개의 Bin으로 표현
#     - 2개의 Bin은 옥타브에서 12개의 각기 다른 반응(Semitones = Chroma)을 의미한다

# In[ ]:


chromagram = librosa.feature.chroma_stft(y, sr=sr, hop_length=512)

plt.figure(figsize=(16,6))
librosa.display.specshow(chromagram, x_axis='time', y_axis='chroma', hop_length=512)
plt.show()


# #### 기도 메타
# - 이거 만든 사람도 알아서 잘 분류하겠지? 하는 마인드로 만들었다고 합니다... 매우 어렵네요

# ### 학습
# #### 데이터셋 로드

# In[ ]:


import pandas as pd

df = pd.read_csv('Data/features_3_sec.csv')  # gtzan 데이터 받으면 포함되어있는 데이터

df.head() # 뭐가 있는가 봐봅시다.


# In[ ]:


#  전처리를 해보아요

x = df.drop(columns =['filename','length','label'])
# 여기서 label은 장르를 의미. 
y = df['label']
# 분석해서 label 즉 장르를 알아내는 작업을 할 계획

scaler = sklearn.preprocessing.MinMaxScaler()
np_scaled = scaler.fit_tramsform(%)

X = pd.DataFrame(np_scaled, columns=X.columns)

X.head()


# ### 데이터셋 분할

# In[6]:


from sklearn.model_selection import train_test_split

X_train, X_test, Y_train, Y_test = train_test_split(X,Y,test_size=0.2, random_state=2021)
# 트레인 셋은 80%, 테스트 셋은 20%만 쓴다는 말이라는데요..?

print(X_train.shape, Y_train.shape)
print(X_test.shape, Y_test.shape)
# 데이터의 갯수를 출력하는 곳


# #### 학습 및 검증
# - xgboost는 설치해야하는 라이브러리라서 anaconda prompt 에
# - pip install xgboost 입력하고 enter 누르면 설치가 됩니다.

# In[8]:


from xgboost import XGBClassifier
from sklearn.metrics import accuracy_score
# xgboost 가 성능이 아주 좋다고 합니다.

xgb = XGBClassifier(n_estimators=1000, learning_rate=0.05)
xgb.fit(X_train, Y_train)
# 학습을 시작하게 하는 .fit()

Y_preds = xgb.predict(X_test)
# 검증할 때 쓰는 .predict() 메소드 ... 결과값 넣기

print('Acuuracy: %.2f' % acciracy_score(Y_test,Y_preds))
# 정답값과 예측 값에 대해 출력하게 하는 로직. 정확도에 대한 값이 출력된다는 듯?


# #### Confusion Matrix 그려보기
# - 그리게 되면 가로측이 우리가 예측한 값
# - 세로측이 정답값이 나오게 됩니다.
# - 오답의 경우가 몇개 나오는데 bpm이나 이런걸로 다른 친구로 예측하는 경우가 있긴한데
# - 높은 확률로 동일한 결과가 나오는 걸 확인가능하다. ( ai의 정확성에 대해서 파악할 때 쓰는듯?)

# In[9]:


from sklearn.metrics import confusion_matrix
import seaborn as sns   # 얘는 내장라이브러리 인듯

cm = comfusion_matrix(Y_test, Y_preds)

plt.figure(figsize(16,9))
sns.heatmap(
    cm,
    annot=True,
    xticklabel=["blues","classical","country","disco","hiphop","jazz","metal","pop","reggae","rock"]
    yticklabel=["blues","classical","country","disco","hiphop","jazz","metal","pop","reggae","rock"]
)
plt.show()


# In[ ]:


from feature, importance in zip(X_test.columns, xgb.feature_importances_):
    print('%s: %.2f' % (feature, impotance))

# feature, importance 개념 : 어떤 feature가 가장 중요한지를 알려주는 메소드?? 같은 아이.
# 특징에 따른 중요도를 알려주는데 특히 가장 중요한 점이 무엇인지 알려주는 것. 솔직히 쓸 일 없을듯;


# ### 빵형 유튭에서 알려주는 간단한 추천 시스템
# - 코사인 유사도를 통해서 알려주는 듯합니다.

# In[ ]:


df_30 = pd.read_scv('Data/features_30_sec.csv', index_col='filename')
# 다운받은 폴더에서 불러오고.

labels = df_30[['label']]
df_30 = df_30.drop(columns=['length','label'])
# 둘은 빠져야 함. -> 오디오의 feature만을 사용해서 추천한다는 가정하에
# 그렇다면 이런식으로 다 가야하나??? feature만 알아내는?
# 우리가 받아오는 음원에는 feature가 다 들어있는가? 음원 파일식으로 어떻게 받아오는가

df_30_scaled = sklearn.preprocesiing.scale(df_30)

df_30 = pd.DataFrame(df_30_scaled, columns=df_30.columns)

df_30.head()


# In[11]:


from sklearn.metrics.pairwise import cosine_similarity # 얘도 바로 import 가능

similarity = cosine_similarity(df_30)
# 전처리한 데이터만 넣어주면 알아서 처리해준다.

sim_df = pd.DataFrame(similarity, index=labels.index, columns=labels.index)
# 가로 세로가 전부 음악을 index한 곡들이 나오고 각 곡들 별로 코사인 유사도를 알려주게 됩니다.
# 상당히 신기합니다. 해보세요 심심할 때

sim_df.head()

# 이부분은 코사인 유사도를 통해 백터값을 알아내고 백터값이 1에 가까울수록 비슷한 음악임을
# -1에 가까울 수록 전혀 다른 음악임을 나타냅니다.


# In[ ]:


# find_similar_songs 함수 정의하기!
def find_similar_songs(name, n=5):
    series = sim_df[name].sort_values(ascending=False)
    
    series = series.drop(name)
    
    return series.head(n).to_frame()
    # 매개변수에 들어갈 친구와 가장 비슷한 노래 5곡을 추천해 달라는 함수
    # 여기서 n은 강사님들한테 받은 top_n 이랑 같은 부분이고 name에는 저장된 곡명을 넣으면 된다.
    
find_similar_songs('rock.0000.wav')
# rock.0000 이라는 음원파일과 가장 유사도가 높은 곡 5개를 추천해달라! 는 의미
# 거의다 같은 장르가 출력되지만 한번씩 비슷한 느낌의 다른 장르의 곡이 출력되기도 합니다.


# ### 그래서 어떻게?
# #### 이걸 어떻게 대입할지 고민해봐야 하는 데  문제점이 있습니다.
# #### 음악파일 (재생이 가능한) 친구를 바탕으로 feature를 추출해서 그 feature를 바탕으로 코사인 유사도를 찾는 작업을 반복하는 것인데 음원파일을 어떻게 받아오는가? 
# #### 크롤링해서 받아오는 것이 음원파일을 대체할 수 있는가?
# #### 일단 가서 데이터 다운받아서 폴더별 음원파일에 특징을 아라보자

# In[ ]:




