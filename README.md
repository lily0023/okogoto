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
URLは[こちら](https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=okogoto.drawio#R7Z1bj9o4FMc%2FzUjdh65IQiA8LvQmdWa3mnbVdl%2BQh5iQnSSOHDNAP%2F06YCeAuTiz5GpLlUocxwGfv%2F3zsY89d9YkXH%2FEIF48IBcGd2bPXd9Z7%2B5M0%2Bj1%2BvS%2FNGWzSxk45i7Bw77LMuUJX%2F1fkD%2FJUpe%2BC5ODjAShgPjxYeIMRRGckYM0gDFaHWabo%2BDwrTHwoJDwdQYCMfW775IFSzUGo%2FzGJ%2Bh7C%2FZqxxzuboSAZ2a%2FJFkAF632kqz3d9YEI0R2n8L1BAZp5fF62T334czd7IthGBGZB%2Fp%2FP0c%2F%2Fvnz5enL26f72eefnx6%2BfH9rGA77dmTDfzJ0aQ2wS4TJAnkoAsH7PHWM0TJyYVpuj17lee4RimmiQRP%2FhYRsmDnBkiCatCBhwO7CtU9%2BpI%2F%2FbrOrn6yw9PO79f7Fhl9EBG9%2B7F%2F8zEtIL%2FPHtlf8uYRg9AwnKECYprhwDpYB2eZy%2F0gFQhPfP%2F6CGH1DDyDa7O588IMgex5gkucMQeT%2BFUF%2BYy%2BjaBBmowQt8QxesgITNsAeJJfy9Zi1UhPtvYIZ%2FCNEIaQ%2FnWbAMADEfzkUMWBtwcvy5XKhH5hiiqhnV%2B4LCJbsTcsE4kRQFJV%2BnH4k4CnIao6Jw0qrjrZeAvwIYqaPGQoCECf%2BNvsuZeEH7j3YoCXhBfGr8dxfQ%2Fdx19SNrTxX97SwhNllTgvnek5vg8D3Ivp5Ru2UvnGMYUK%2Fyz1ICMuxp9SzRn2BmMD1RSOwuwPWAbAesD9k16u8P7F4J7HY60qyjDe3mynY7bLJHlPtjxcI%2B79SQx20DGbG7fXKDwMQ0f4QuEdJY%2BTy9jinLYa3xghtW9KhudNMLkbxN94c0oQY%2BRHZ1oM9pv9ozUzSpm%2FT7zqh10Z%2BTf%2Bl2TGZoIi2fSqrtAxIrbuCqYXHZNtJpYUGcM7Lx6ze089PiBAUnhXAxaZwXRVMBpakCuyyRGAJIvjy%2BawM6O8nPggeKWJB5AU7o22JC3KjnbDsybrO6ve44o9bKqLVOQ%2B2He%2FCd11IW%2B14tfAJ%2FBqDbYe6ooOOa%2B31Ygu4bq59%2BxQ0Dyssr7TCpYGA9lARILT9UOImgs2z7%2Fl6GfQFGdDs9cqAd9C7vOOEGtuPvPvdk4MjndgN0cn6bLM2RzfVjVRxFQjH1hCRgsjpoeFtIOJIQsQqCyIDeRFU03dA1%2BfllUsQW9pWV%2Fr8S7YpTpDj0iroCIaCBiIQwje02dBe%2B7ems6QJCinIjtcrRqq4CiTjaHbUzg7DqBseI2Xh4Ugbq%2Bvw4CLcEwHw4BvaZqAHscL0kJeIcvQwxHlHjY%2FK8dGvGx9GgWnMjvHDkDdX5wEizmN6MHIh1gwpIhP1ICJOfGqIVA4R2bWw8iBSYBqzMRCRNUdf2h6dp4Q4UYlR0G4%2F4%2FYqUA4Cluh9aghUDQGzVzcErAIOZdsgkElcQ8ASHUYYAj9o81LF7VWgHgS0J9AACMjGQ5UHgQ57Apb2BLKqED2BGd7EBLrTGCTJCmFXBR5op%2BB83YgBDZoHlfNgUDsPCgQptI4HQ2l7dJ4HYhRCQl%2BrAgPkRaAcA%2Fp6ibkBDBjVzYC%2BOGPQGQb09RpyVhXiGjKGCSSZRzAl6BlGCjChgCjUY4Le8VA%2FE7L%2Bvz4mtHHPg2zz17sasqoQZwFOMWEK17FPb0wBeePSL0T8EHYaEHpXw%2Fm6KRDQrgFRFiDsugHBv0AnATGStkfXAWGLUwRHgNguLk8TWqPK0EFeHsrRwRadTE2HyulQ%2B45pu0C0QdvokElc08EWJwvAbAaTZDqj7yTUeZge0SJu%2B76324tEOUYMtQdRPyP6tW%2BMdjrsQQy1B5GZWfQgZhiCNBRJEX%2BhgBiUY4Gj%2FYUGsKD2Xc5Oh%2F0FR%2FsLWVWI%2FsIydlViQQExKMcCw2zfMc3GXaFjmht0HLPNVnivn8fMN9g35DxmW1yajlFC9IHMh%2F1Gn%2FtXDPL2iZgCwznR8s1%2BWZS3dcy53GCvyPl7A2lhnD%2BT%2BaQOypscFmPOFTqU2dZR6VlViBOB%2BljmVynl%2FFjRsG%2BqHKniKpDOoEB8mtIoKTBvUBwlJ7YvVYuSgTii%2BFA3Sio7H20gb6%2Buk2QgDikI8KbNp0kj1KEcPYb6MIQG0OPExqdq6TEUpyNrp8f%2B8LJXagcx1MclZFUhjibTv%2FHVAn40Ui7K8YSPgzVP6uSJITvDWZ470sYj1m403OxJm6vrNBmYggqekYcImvphGv7Y4g22lWtFPZTogJgmoOTE%2FqqKUdLGiJgbdQ86YCarCtFDnaEwpPWnKVJAJspRZKgdkiZQ5MQ%2BrIpnuNrokEjaY6g9jqwqRI9DtRh77VKcrRtHh101AAbmiQ1X1cLA6fBZn46OqsqqQoyqUi3IXgdOna0bwxwKltdB9mUF2Y9YxqtB9jxaoyEx9iPRbyDAKxZib%2FbuOh5iP%2BQLTjwcTtbfc8pC%2FEh0BPRQ739G2I%2FkdZH9raeaR3ojcRFBoQj7rBHoseBIXEVoV0xLuRH2BZSi3EBxpA8CvvmsQXGU1L4OOWrjQcA36h30OcFZVYhTiHFAq1evQhYQiXIIMXri8CPwn6Heqn2kCJPVE9%2BhKztVnEU83v4vhvc0%2Fm%2FuSebtoT2btY2eOABQyJfM24EeBBg9cRSgvcnXaUXBsUCB1UelgVLAn3wFUGrfsm30xPXJ2nfdVeZT5s1A88Tgw9z2bbtrhkDUg4ghrktqiFQPkdp3bhuGKQhBIYgY8lMM3YeIuNaZHgeoNkQKCEQ9iJiWoIwKI6D4571YpusRUNlF6yKguIGvRkDx8wVKj4Cilxghsi8q2s4WD8iFaY7%2FAA%3D%3D)