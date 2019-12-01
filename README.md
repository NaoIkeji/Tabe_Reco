# TABE RECO
TABE RECO(タベレコ)は食べたものを記録できるサイトです。
  
日々の食事を管理して、**健康的な食生活を送るサポート**をします。

![tabereco_logo](https://user-images.githubusercontent.com/49096883/69711891-2fc3d400-1145-11ea-8cbb-55ee3b0f13b7.jpg)
  
ダイエットしたい、バランスの良い食事をしたいなど
  
**食事の自己管理**を目的とした方におすすめのサイトとなっています。

## 目次(Table of contents)
- [機能(Feature)](#feature)
- [デモ(Demo)](#demo)
- [使い方(Usage)](#usage)
  - [自分の記録](#feature_1)
  - [みんなの広場](#feature_2)
  - [栄養の知識](#feature_3)
- [要件(Requirement)](#requirement)
  - [フロントエンド](#requirement_01)
  - [サーバサイド](#requirement_02)
  - [インフラ](requirement_03)
  - [その他](requirement_04)
- [著者(Author)](#author)
- [ライセンス(Licence)](#licence)
- [謝辞(Acknowledgments)](#acknowledgments)

<a id="feature"></a>
## 機能(Feature)
- 食事を自己管理することができる
- 食事の入力が簡単に短時間でできる
- 1日の栄養バランスがグラフでわかる
- 目標に向かって頑張る仲間同士で応援しあうことができる
- 栄養や食の知識をつけることができる

<a id="demo"></a>
## デモ(Demo)
TABE RECO (http://www.tabereco.xyz/)

![PF_demo](https://user-images.githubusercontent.com/49096883/69917167-7186ae80-14a6-11ea-9834-ae6d2ff5f352.gif)


<a id="usage"></a>
## 使い方(Usage)
<a id="feature_1"></a>
### 自分の記録
##### ご自身の食事管理にご利用ください。
1. まずは「食事記録する」から食べたものを記録します。
2. 記録するとマイページのカレンダーに「登録済み」と表示されます。
3. カレンダーの「登録済み」を選択すると、その日の食べた食事一覧が見れます。
4. 食事一覧ページの最下部にあるオレンジのボタンを選択します。
5. その日に食べた1日の栄養バランスと食事アドバイスを確認することができます。
6. 適正量に近づけることができるように、日々の食事管理に役立てていただければ幸いです。
- 食事記録の「1日のバランスチェック」項目は詳細に入力することをおすすめします。

<a id="feature_2"></a>
### みんなの広場
##### ひとりで頑張れない方は登録済みユーザーとつながって一緒に頑張りましょう。
1. プロフィール登録で自分の目標や自己紹介を登録します。
2. 「新規投稿する」から登録済みの目標を選択して仲間に宣言しましょう。
3. 他のユーザーが目標を達成できていたら「いいね」をすることができます。
4. もし、目標達成できていなければ、「応援する」ことができます。
5. コメントも可能ですので、仲間同士で情報共有などにご利用ください。
6. お気に入りユーザーをフォローすることも可能です。

<a id="feature_3"></a>
### 栄養の知識
##### 運営側から栄養や食に関する情報を発信いたします。
1. 一覧ページから投稿記事を選択すると詳細を確認することができます。 
2. 食事の基本、栄養素、食べ合わせ、レシピなど随時更新予定です。
3. 日々の食生活の参考にしていただければ幸いです。


<a id="requirement"></a>
## 要件(Requirement)
<a id="requirement_01"></a>
#### フロントエンド
- HTML / CSS
- Bootstrap
- JavaScript / jQuery / Ajax

<a id="requirement_02"></a>
#### サーバサイド
- Ruby / Ruby on Rails
- 利用したライブラリ
  
   devise, refile, refile-mini_magick, kaminari, cocoon
  
   bootstrap-sass, chart-js-rails, gon
  
   fullcalendar-rails, momentjs-rails, jquery-rails
  
   pry-byebug, ransack, rails-i18n

<a id="requirement_03"></a>
#### インフラ
- AWS(EC2, RDS, AMI, EIP)
- Vagrant / VirtualBox

<a id="requirement_04"></a>
#### その他
- SQL


<a id="author"></a>
## 著者(Author)
- Name: Nao Ikeji
- Mail: na3o.g.7@gmail.com

<a id="licence"></a>
## ライセンス(Licence)
この作品はMITライセンスにて提供しています。
  
詳しくは[LICENSE](https://github.com/NaoIkeji/Tabe_Reco/blob/master/LICENSE) ファイルをご確認ください。  

<a id="acknowledgments"></a>
## 謝辞(Acknowledgments)
#### インスピレーション(Inspiration)
- [あすけん](https://www.asken.jp/)
- [FiNC](https://finc.com/)
- [DietPlus](https://dietplus.jp/)
#### 感謝(Thanks!!)
- [DMM WEB CAMP 難波校](https://web-camp.io/)

