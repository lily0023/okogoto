# okogoto

## サービス概要
いつの間にか小言を言われる側から、小言を言う側の立場になってしまっていた人が  
自分の言葉を多様な視点で捉えることができるように  
3種類の背景から雰囲気を選択し、言葉を合成した画像を作成することができるサービス

## メインのターゲットユーザー
- 小言を言う立場になってしまった人
- 自分の言葉が他人からどんな印象であるのか気になる人

## ユーザーが抱える課題  
「小言」とはある人から見れば「格言、アドバイス」であり、「格言、アドバイス」とはある人から見れば「小言」ともなってしまう、捉え方が大切な言葉である。
しかし、人によって同じ言葉でも受け取り方が異なるため、自分一人で多様な視点で捉えることは難しい。

## 解決方法
背景やフォントで印象を変えることによって、自分の言葉を違った印象で捉えられるようにする。

## 実装予定の機能
- 一般ユーザー
  - 未登録ユーザー
    - サイトに訪れたユーザにサイトの説明(トップページ)を表示することができる
    - ゲストログインすることができる
      - 投稿一覧を見ることができる
      - 投稿にわかるボタンが押せる
    - ユーザー登録することができる
  - 登録ユーザー
    - ログインできる
    - 画像作成することができる
      - 背景の雰囲気を選択して、入力した言葉（小言）を合成した画像を生成することができる
        <details>
          <summary>用意する背景画像</summary>
          ・入力した言葉が格言のように見える雰囲気の画像<br>
          ・入力した言葉が親から言われる小言のように見える雰囲気の画像<br>
          ・入力した言葉が親友を想ってかける言葉のように見える雰囲気の画像
        </details>
      - 選択した背景画像に合わせてフォントも変更されるようにする
    - 作成した画像に、好きなコメント(どんな経験、状況からその小言が生まれたのか？小言を客観的に見た感想）をつけて投稿できる
      - 投稿するときにタグをつけることができる(#学校, #仕事, #日常生活　など)
      - 投稿後の投稿詳細ページから投稿をTwitterに共有できる(アイキャッチ画像には作成した画像を使用)
    - 投稿一覧を見ることができる
    - 投稿一覧の保存ボタンから、作成された画像を保存できる(元の画像、スマホの壁紙、PCの壁紙として使える３サイズ）
    - タグで投稿を検索することができる
    - 投稿に共感することができる
      - いいねのようにわかるボタンを押すことができる
    - マイページで自分の投稿を見ることができる
    - 自分の投稿を編集・削除することができる
    - プロフィールを編集することができる(ニックネーム, 年代, 性別)
    - 退会機能
    - ログアウトできる
- 管理者ユーザー
  - 一般ユーザーを管理できる(検索・一覧・詳細・編集)
  - 投稿を管理できる(検索・一覧・詳細・編集・削除)

## なぜこのサービスを作りたいと思ったのか？
「小言」と聞くとあまりいい印象を抱かない人が多いかもしれないですが、  
私は「小言」とは人生経験から生まれるもので、「小言」は必ずしもなくすべきものではない、と考えています。 

親、教師、上司など様々な人からかけられる言葉は、かけられる方からすれば「小言」にすぎないかもしれません。  

しかし、その小言を発する親、教師、上司からすれば(言い方はもちろん大切ですが)その小言は、人生の経験から学んできた「格言」であり、相手を想う気持ちからかける「アドバイス」であると私は考えます。 

つまり、ある人から見た「小言」とは違う人から見た「格言」や「アドバイス」であり、またある人から見た「格言」や「アドバイス」とは違う人から見れば「小言」に過ぎないかもしれないということです。

大切なことは、「小言」を言わないことではなく、その言葉を他人がどう捉えるのかを想像することであると思います。
そこで背景やフォントを使って、少しでも他人の視点に近い形で、小言を見直せるような機会があると面白いのではないかと思い、このサービスを作ろうと思いました。

## 実装スケジュール
1. 企画（アイデア企画・技術調査）：4/22〆切
2. 設計（README作成・画面遷移図作成・ER図作成）：4/28〆切
3. 機能実装：4/28 - 5/28
4. MVPリリース：5/28
5. 本リリース：6/11

## 画面遷移図
URLは[こちら](https://www.figma.com/file/ZAzFVnnQfExiEaMmkomisv/okogoto?node-id=0%3A1&t=9IdkUgk58acLBDmW-1)

## ER図
URLは[こちら](https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=okogoto.drawio#R7Z1bj9soFMc%2FzUjdh65iO87lcZPepM7sVtOu2u5LxMTE8Y5tLEwmST%2F94gTsJOSCZ30HqVIDJiTh%2FOHHgQNzZ02DzUcMouUDcqB%2FZ%2FaczZ317s40DWtg0f%2BSnO0%2BZ2wO9hku9hxWKMv46v2CLLPHcleeA%2BOjggQhn3jRceYchSGck6M8gDFaHxdbIP%2F4UyPgQiHj6xz4Yu53zyFLlmsMxtmDT9Bzl%2ByjR%2BZw%2FyAAvDD7JfESOGh9kGW9v7OmGCGyfxVsptBPGo%2B3y%2F59Hy48Tb8YhiGReUP%2F7%2Bfwxz9%2Fvjx9eft0P%2F%2F889PDl%2B9vDWPEvh3Z8p8MHdoCLIkwWSIXhcB%2Fn%2BVOMFqFDkzq7dFUVuYeoYhmGjTzX0jIlpkTrAiiWUsS%2BOwp3HjkR%2FL2322W%2BskqS16%2F2xwmtjwRErz9cZj4mdWQJLO37VL8fTHB6BlOkY8wzXHgAqx8sivl%2FJEIhGa%2Bf%2FwFMfqGHkC43T%2F54Pl%2B%2Bn6ASVYyAKHzVwj5g4OCokGYjWK0wnN4zQpM2AC7kFwr12PWSkx08BHM4B8hCiD96bQAhj4g3suxiAHrC25aLpMLfcEUk0c9%2B3pfgL9in7SKIY4FRVHpR8lLAp78tOWYOKyk6WjvJcALIWb6mCPfB1Hs7Yrvc5ae79yDLVoRXhFPTRbeBjqP%2B65u7OS5vqeVxcwuC1o513PyGPieG9LXc2qn5BMnGMb0u9yDmLASB0q9aNQXiAncXDUCezpgAwAbAftDll5n44nFB4nlwVCSFizcbqZgt%2Bsme0y0P1ki7P1KDHXUM5gZd%2Bm1F%2FggpOMhcE6yJsjh%2FXFBewzvjSHa9aRjcyeFHIyib7w7JBkR8kKyawd7Qv%2FRlpkmXd%2Bm33VK00aWpv%2BS4phMUUj7PpVVUgek1l3DxMITshukkkp9uOD1Y9buyesnRAgKLgrgale4rQomA0tSBXZZIrAEEXz5fFEG9PcTD%2FiPFLEgdP290XbEBZnRzlj2bFun7Xva8Kc9FdHmXPi7gXfpOQ6kvXayXnoEfo3AbkBd00nHrf56tQfcNtehfXKah1WWNVru2oBPR6gQENp%2FKHFjwebp93y9DPqCDGjxemXAB%2Bh92UlMje2F7v3%2BnYMTndgN0cnmYrc2x4XqRqq6CoRja4hIQeT81LAYiIwkIWKVBZGBvAiqGTug4%2FH6yiWILW2rG2P%2BNdvkJ8hpbRUMBENBAyEI4Bvabeio%2FVvTWdIEheRkx%2BsVI1VdBZIZaXbUzg7DqBseY2XhMZI2VtfhwUV4IALgwje0z0AXYoXpIS8R5ehhiOuOGh%2BV46NfNz6MHMuYHeOHIW%2BuzgNEXMd0YehArBmSRybqQURc%2BNQQqRwisnth5UEkxzJmYyAia46%2BtD06TwlxoRIjv91%2BRvEqUA4Cluh9aghUDQGzVzcErBwOZdsgkEpcQ8ASHUYYAM9v81ZF8SpQDwLaE2gABGTjocqDQIc9AUt7AmlTiJ7AHG8jAp1ZBOJ4jbCjAg%2B0U3C5bcSABs2DynkwqJ0HOYIUWseDobQ9Os8DMQohph%2BrAgPkRaAcA%2Fp6i7kBDBjXzYC%2BuGLQGQb09R5y2hTiHjKGMSSpRzAj6BmGCjAhhyjUY4I%2B8VA%2FE9Lxvz4mtPHMg2z316ca0qYQVwHOMWEGN5FHH8wAeePQL0S8AHYaEPpUw%2BW2yRHQrgFRFiDsugHBv0AnATGWtkfXAWGLSwQngNhtLs9i2qLK0EFeHsrRwRadTE2HyulQ%2B4lpO0e0QdvokEpc08EWFwvAfA7jeDann0mo8zA7oUXU9nNvxYtEOUYMtQdRPyP6tR%2BMHnXYgxhqDyI1s%2BhBzDEESSiSIv5CDjEox4KR9hcawILaTzmPOuwvjLS%2FkDaF6C%2BsIkclFuQQg3IsMMz2XdNs3OW6prlB1zHbbIf39n3M%2FIB9Q%2B5jtsWt6QjFRF%2FIfDxu9Ll%2FxSBvn4kpMEZner7ZL4vyto45l5vs5bl%2FbyAtjMt3Mp%2FVQXmLw2LMuUKXMts6Kj1tCnEhUF%2FL%2FCqlXJ4rGnahypGqrgLp8IMzGiXFrRvkR8mZ40vVomTQxjsNihkd0h6gOTIwBRU8UyeQoJkXJPuNLY5or1wr6pFEr0A3gCRnDkFVTJI2rkAXNDroBeq0KcQF6jkKAtp%2BGiI5ZKIeRHIcl9EQKQsihuwSZ3kUEVc4P9S9tFUdR%2BQN1nmOiEucBLiz5q9uNUIdyuFjqC9nawI%2BzhyqqhYfQ3H6WTs%2BDte7e6WOEEN9f1vaFOJ8Mvmjwy0ASCPloh5Q9PZIE4By5hxWxUBp4%2F6IbP%2FXGyBpU4gbIKrF2OsdjottM9JhVw2AgXnmwFW1MBh1%2BK7PkY6qSptCjKpSLcheB05dbBvDHAqW10H2ZQXZj1nBm0H2fHW0ITH2Y9FvIMDNF2Jv9u46HmI%2F5PtNPBxO1t8blYX4segI6Kne%2F4ywH8vrIv1bTzXP9MZiTJNCEfZpJ9BzwbG4sdSuJeRyI%2BxzKEW5ieJYXwRc%2BKpBfpTUviU5buNFwAWNDvqe4LQpxCXEEAQ6sj6PRpQjiNETZx%2B%2B9wz1Se0TRZisnfgBXdmV4jTesfg%2FGN7T9C%2Fckcz6Q3vOahs9kf8KuZJZP9BzAKMnTgK0M%2Fk6rSg4F8ix%2Bag0UHK4k68ASu0nto2euD1Ze4xrZS5l1g00Tww%2BzW1fkGszBKIeRAxxW1JDpHqI1H5Y2zBMQQgKQcSQX2LoPkTErc7kNkC1IZJDIOpBxLQEZVQYAMVfH4Qy3Q6AShOtC4DiBr4ZAMVP85QeAEWTGCFyKCraz5YPyIFJif8A)