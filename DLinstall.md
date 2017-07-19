# 深層学習 演習環境インストールの方法

## Tensorflow

基本的には、公式サイトのインストール手順(
https://www.tensorflow.org/install/install_windows) 
に従います。

64bitOSの場合で説明しますので、32bitOSの場合はダウンロードするファイルを適当に
読み替えてください。

1. Anaconda Promptを開く
1. conda create -n tensorflow python=3.5 jupyter
1. activate tensorflow
1. pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/windows/cpu/tensorflow-1.2.1-cp35-cp35m-win_amd64.whl
1. ipython kernel install --user --name=tensorflow --display-name=tensorflow
1. jupyter kernelspec list でtensorflow環境ができていることを確認
1. Jupyter notebookを起動
1. カーネルtensorflowでノートを作成し、以下のサンプルスクリプトを実行 

```
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
print(sess.run(hello))
```

## Keras

1. Anaconda Promptを開く
1. activate tensorflow
1. http://www.lfd.uci.edu/%7Egohlke/pythonlibs/ から

** numpy-1.13.1+mkl-cp35-cp35m-win_amd64.whl
** scipy-0.19.1-cp35-cp35m-win_amd64.whl

   をダウンロードし、Cドライブ直下に置く

1. pip install --ignore-installed --upgrade C:\numpy-1.13.1+mkl-cp35-cp35m-win_amd64.whl
1. pip install --ignore-installed --upgrade C:\scipy-0.19.1-cp35-cp35m-win_amd64.whl
1. pip install keras
1. Jupyter notebookを起動
1. カーネルtensorflowでノートを作成し、以下のサンプルスクリプトを実行 

```
import keras
keras.__version__
```
