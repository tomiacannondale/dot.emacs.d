個人用emacs設定
=============

## インストール ##

    git clone https://github.com/tomiacannondale/dot.emacs.d.git ~/.emacs.d
	mkdir ~/.emacs.d/elisp
	mkdir ~/.emacs.d/conf/local

el-getを使っているので、emacsを起動すると自動的に他のelispはインストールされる(はず)。

## TODO ##

### まだel-get化出来てないelispをel-getで管理出来るようにする ###

* yatex

  el-getでインストール出来るリポジトリがマーシャルなのでシステムにマーシャルのインストールをする必要がある。
  さらにマーシャルをインストールするにはpythonが必要で。。というところで挫折中。

## 見せたくない設定の置き場 ##

    ~/.emacs.d/conf/local

ただし ```.gitignore`` に指定されているので、構成管理されない。
