User.create!(
  [
    {
      name:  "テスト太郎",
      email: "xxx@gmail.com",
      password:              "123456",
      password_confirmation: "123456"
    },
    {
      name:  "かねだ",
      email: "opaebu@gmail.com",
      password:              "kanekane-b",
      password_confirmation: "kanekane-b"
    },
    {
      name:  "ぴよ",
      email: "dream_star@docomo.ne.jp",
      password:              "dream_star",
      password_confirmation: "dream_star"
    },
    {
      name:  "Ryu_0315",
      email: "fukuoba@au.com",
      password:              "kana_1228",
      password_confirmation: "kana_1228"
    },
    {
      name:  "Donald John Trump",
      email: "iaeg13in4aeg@yahoo.co.jp",
      password:              "GF/kht843LsN",
      password_confirmation: "GF/kht843LsN"
    }
  ]
)

user = User.find_by(id: 1)
user.videos.create!(
  [
    {
      title: "爆炎ベイブレード",
      youtube_url: "rbTL3PIFSH8",
      tag_list: ["ベイブレード", "実験", "懐かしい", "魔改造"]
    },
    {
      title: "プリコネ星6育成",
      youtube_url: "_iBH5jMKMZs",
      tag_list: ["ゲーム", "プリコネ", "ソシャゲ"]
    },
    {
      title: "ポケモン　バグ詰み集",
      youtube_url: "r842XsJ6jeY",
      tag_list: ["ポケモン", "ゲーム", "バグ"]
    },
    {
      title: "下水を再利用した街を作る",
      youtube_url: "Vyx1Z2v3yUA",
      tag_list: ["Cities:Skylines", "ゲーム", "実況"]
    },
    {
      title: "スーパーマリオ64",
      youtube_url: "dmA5IPmrqlU",
      tag_list: ["ゲーム", "RTA", "マリオ", "実況"]
    },
    {
      title: "どこへ向かう",
      youtube_url: "oeWRLGW_39s",
      tag_list: ["ADHD", "発達障害"]
    },
    {
      title: "ASD話し方特徴",
      youtube_url: "tVAPqjTQ5bs",
      tag_list: ["ASD", "アスペ", "発達障害", "YouTuber"]
    },
    {
      title: "社会風刺イラスト",
      youtube_url: "sMFoBzk3zmY",
      tag_list: ["風刺", "現代社会"]
    }
  ]
)

user = User.find_by(id: 2)
user.videos.create!(
  [
    {
      title: "建前使えない証券マン",
      youtube_url: "T3jjPKjNIcI",
      tag_list: ["証券会社", "投資", "いらすとや"]
    },
    {
      title: "嘘発見器面接",
      youtube_url: "DRSFSIAvotg",
      tag_list: ["面接", "ブラック企業", "就職"]
    },
    {
      title: "ポートフォリオの作り方",
      youtube_url: "r842XsJ6jeY",
      tag_list: ["プログラミング", "エンジニア", "ポートフォリオ"]
    },
    {
      title: "10代全員に伝えたい残酷な真実",
      youtube_url: "Gla558ydSlM",
      tag_list: ["マコなり社長", "仕事"]
    },
    {
      title: "ひろゆき雑談",
      youtube_url: "UCg5qaYUq-E",
      tag_list: ["ひろゆき", "高齢社会", "雑談"]
    }
  ]
)

user = User.find_by(id: 3)
user.videos.create!(
  [
    {
      title: "男子禁制♡恋愛相談！",
      youtube_url: "yOQNPR1po2M",
      tag_list: ["恋愛"]
    },
    {
      title: "VT1poTJcPj0",
      youtube_url: "VT1poTJcPj0",
      tag_list: ["占い", "恋愛"]
    },
    {
      title: "Pretender",
      youtube_url: "TQ8WlA2GXbk",
      tag_list: ["official髭男dism","MV"]
    },
    {
      title: "宿命",
      youtube_url: "kgOFJG881I",
      tag_list: ["official髭男dism","MV"]
    }
  ]
)

user = User.find_by(id: 4)
user.videos.create!(
  [
    {
      title: "湘南乃風 - 「Summers」",
      youtube_url: "oeWRLGW_39s",
      tag_list: ["湘南乃風", "MV", "四方戦風"]
    },
    {
      title: "ワイルド・スピード／ジェットブレイク",
      youtube_url: "GQmHqUdbSBE",
      tag_list: ["WildSpeed", "映画", "予告"]
    },
    {
      title: "純恋歌",
      youtube_url: "YQSS7SgGia8",
      tag_list: ["音楽", "湘南乃風", "2000年代"]
    }
  ]
)

user = User.find_by(id: 5)
user.videos.create!(
  [
    {
      title: "DQN事故",
      youtube_url: "obJXb52HXTE",
      tag_list: ["DQN", "事故"]
    },
    {
      title: "どこか闇を感じずにはいられない画像集",
      youtube_url: "t5y7oVK6odY",
      tag_list: ["画像集"]
    },
    {
      title: "依存させるの方法",
      youtube_url: "DuLSgEJ5JKM",
      tag_list: ["心理学", "恋愛", "依存"]
    },
    {
      title: "King Gnu - 白日",
      youtube_url: "ony539T074w",
      tag_list: ["King Gnu", "MV"]
    },
    {
      title: "パプリカ",
      youtube_url: "s582L3gujnw",
      tag_list: ["MV", "米津玄師"]
    },
    {
      title: "玄倉川水難事故",
      youtube_url: "s582L3gujnw",
      tag_list: ["ニュース", "事故", "DQN"]
    }
  ]
)