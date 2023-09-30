const menu = [
  {
     "id": 1,
     "name": "アジフライ",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 360,
     "kcal": 340,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000001.jpg"
  },
  {
     "id": 2,
     "name": "アジの南蛮漬け",
     "dish_type": "sub_dish",
     "category_slug":"fish",
     "price": 180,
     "kcal": 180,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000002.jpg"
  },
  {
     "id": 3,
     "name": "ビーフステーキ",
     "dish_type": "main_dish",
     "category_slug":"meat",
     "price": 700,
     "kcal": 680,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000003.jpg"
  },
  {
     "id": 4,
     "name": "ボンゴレビアンコ",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 450,
     "kcal": 470,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000004.jpg"
  },
  {
     "id": 5,
     "name": "ボンゴレロッソ",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 450,
     "kcal": 370,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000005.jpg"
  },
  {
     "id": 6,
     "name": "ブリの照り焼き",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 280,
     "kcal": 260,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000006.jpg"
  },
  {
     "id": 7,
     "name": "煮卵付き豚の角煮",
     "dish_type": "main_dish",
     "category_slug":"meat",
     "price": 360,
     "kcal": 600,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000007.jpg"
  },
  {
     "id": 8,
     "name": "五目炒飯",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 450,
     "kcal": 650,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000008.jpg"
  },
  {
     "id": 9,
     "name": "チキン南蛮",
     "dish_type": "main_dish",
     "category_slug":"meat",
     "price": 360,
     "kcal": 240,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000009.jpg"
  },
  {
     "id": 10,
     "name": "青椒肉絲",
     "dish_type": "main_dish",
     "category_slug":"vegetable",
     "price": 320,
     "kcal": 290,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000010.jpg"
  },
  {
     "id": 11,
     "name": "中華丼",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 450,
     "kcal": 700,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000011.jpg"
  },
  {
     "id": 12,
     "name": "コーンスープ",
     "dish_type": "soup",
     "category_slug":"soup",
     "price": 180,
     "kcal": 90,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000012.jpg"
  },
  {
     "id": 13,
     "name": "クリームシチュー",
     "dish_type": "main_dish",
     "category_slug":"vegetable",
     "price": 300,
     "kcal": 240,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000013.jpg"
  },
  {
     "id": 14,
     "name": "カレーライス",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 360,
     "kcal": 700,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000014.jpg"
  },
  {
     "id": 15,
     "name": "エビフライ",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 380,
     "kcal": 230,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000015.jpg"
  },
  {
     "id": 16,
     "name": "枝豆",
     "dish_type": "sub_dish",
     "category_slug":"vegetable",
     "price": 180,
     "kcal": 50,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000016.jpg"
  },
  {
     "id": 17,
     "name": "フルーツヨーグルト",
     "dish_type": "sweets",
     "category_slug":"dessert",
     "price": 180,
     "kcal": 80,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000017.jpg"
  },
  {
     "id": 18,
     "name": "ゴーヤーチャンプルー",
     "dish_type": "main_dish",
     "category_slug":"vegetable",
     "price": 280,
     "kcal": 180,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000018.jpg"
  },
  {
     "id": 19,
     "name": "ガーリックトースト",
     "dish_type": "staple_food",
     "category_slug":"bread",
     "price": 240,
     "kcal": 270,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000019.jpg"
  },
  {
     "id": 20,
     "name": "肉餃子",
     "dish_type": "main_dish",
     "category_slug":"meat",
     "price": 280,
     "kcal": 460,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000020.jpg"
  },
  {
     "id": 21,
     "name": "牛丼",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 580,
     "kcal": 720,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000021.jpg"
  },
  {
     "id": 22,
     "name": "ハンバーグカレー",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 580,
     "kcal": 880,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000022.jpg"
  },
  {
     "id": 23,
     "name": "ハンバーグ",
     "dish_type": "main_dish",
     "category_slug":"meat",
     "price": 360,
     "kcal": 470,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000023.jpg"
  },
  {
     "id": 24,
     "name": "八宝菜",
     "dish_type": "main_dish",
     "category_slug":"vegetable",
     "price": 280,
     "kcal": 390,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000024.jpg"
  },
  {
     "id": 25,
     "name": "ひじきの煮物",
     "dish_type": "sub_dish",
     "category_slug":"seaweed",
     "price": 180,
     "kcal": 70,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000025.jpg"
  },
  {
     "id": 26,
     "name": "ほうれん草の白和え",
     "dish_type": "sub_dish",
     "category_slug":"vegetable",
     "price": 180,
     "kcal": 90,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000026.jpg"
  },
  {
     "id": 27,
     "name": "いなり寿司",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 220,
     "kcal": 270,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000027.jpg"
  },
  {
     "id": 28,
     "name": "いわしの梅煮",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 280,
     "kcal": 350,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000028.jpg"
  },
  {
     "id": 29,
     "name": "カキフライ",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 360,
     "kcal": 380,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000029.jpg"
  },
  {
     "id": 30,
     "name": "カルボナーラ",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 450,
     "kcal": 560,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000030.jpg"
  },
  {
     "id": 31,
     "name": "カツ丼",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 580,
     "kcal": 780,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000031.jpg"
  },
  {
     "id": 32,
     "name": "カツサンド",
     "dish_type": "staple_food",
     "category_slug":"bread",
     "price": 390,
     "kcal": 590,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000032.jpg"
  },
  {
     "id": 33,
     "name": "カツオのお刺身",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 300,
     "kcal": 280,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000033.jpg"
  },
  {
     "id": 34,
     "name": "カツオのたたき",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 360,
     "kcal": 340,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000034.jpg"
  },
  {
     "id": 35,
     "name": "キムチ",
     "dish_type": "sub_dish",
     "category_slug":"vegetable",
     "price": 180,
     "kcal": 100,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000035.jpg"
  },
  {
     "id": 36,
     "name": "きんぴらごぼう",
     "dish_type": "sub_dish",
     "category_slug":"vegetable",
     "price": 180,
     "kcal": 140,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000036.jpg"
  },
  {
     "id": 37,
     "name": "きつねうどん",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 360,
     "kcal": 350,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000037.jpg"
  },
  {
     "id": 38,
     "name": "栗ご飯",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 160,
     "kcal": 220,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000038.jpg"
  },
  {
     "id": 39,
     "name": "麻婆丼",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 580,
     "kcal": 760,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000039.jpg"
  },
  {
     "id": 40,
     "name": "麻婆豆腐",
     "dish_type": "main_dish",
     "category_slug":"meat",
     "price": 280,
     "kcal": 380,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000040.jpg"
  },
  {
     "id": 41,
     "name": "舞茸と玉ねぎの味噌汁",
     "dish_type": "soup",
     "category_slug":"soup",
     "price": 160,
     "kcal": 120,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000041.jpg"
  },
  {
     "id": 42,
     "name": "抹茶アイスクリーム",
     "dish_type": "sweets",
     "category_slug":"dessert",
     "price": 100,
     "kcal": 90,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000042.jpg"
  },
  {
     "id": 43,
     "name": "ミートソース",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 450,
     "kcal": 620,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000043.jpg"
  },
  {
     "id": 44,
     "name": "めかぶ",
     "dish_type": "sub_dish",
     "category_slug":"seaweed",
     "price": 180,
     "kcal": 60,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000044.jpg"
  },
  {
     "id": 45,
     "name": "メンマ",
     "dish_type": "sub_dish",
     "category_slug":"vegetable",
     "price": 180,
     "kcal": 70,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000045.jpg"
  },
  {
     "id": 46,
     "name": "明太子",
     "dish_type": "sub_dish",
     "category_slug":"fish",
     "price": 180,
     "kcal": 120,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000046.jpg"
  },
  {
     "id": 47,
     "name": "サバの味噌煮",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 360,
     "kcal": 300,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000047.jpg"
  },
  {
     "id": 48,
     "name": "ミックスグリル",
     "dish_type": "main_dish",
     "category_slug":"meat",
     "price": 700,
     "kcal": 760,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000048.jpg"
  },
  {
     "id": 49,
     "name": "もずく酢",
     "dish_type": "sub_dish",
     "category_slug":"seaweed",
     "price": 180,
     "kcal": 50,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000049.jpg"
  },
  {
     "id": 50,
     "name": "なめこと小松菜の味噌汁",
     "dish_type": "soup",
     "category_slug":"soup",
     "price": 160,
     "kcal": 150,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000050.jpg"
  },
  {
     "id": 51,
     "name": "ナポリタン",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 450,
     "kcal": 650,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000051.jpg"
  },
  {
     "id": 52,
     "name": "肉じゃが",
     "dish_type": "sub_dish",
     "category_slug":"meat",
     "price": 220,
     "kcal": 370,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000052.jpg"
  },
  {
     "id": 53,
     "name": "かぼちゃの煮物",
     "dish_type": "sub_dish",
     "category_slug":"vegetable",
     "price": 220,
     "kcal": 200,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000053.jpg"
  },
  {
     "id": 54,
     "name": "ニラ玉",
     "dish_type": "main_dish",
     "category_slug":"vegetable",
     "price": 280,
     "kcal": 420,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000054.jpg"
  },
  {
     "id": 55,
     "name": "ほうれん草のお浸し",
     "dish_type": "sub_dish",
     "category_slug":"vegetable",
     "price": 180,
     "kcal": 150,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000055.jpg"
  },
  {
     "id": 56,
     "name": "お好み焼き",
     "dish_type": "main_dish",
     "category_slug":"bread",
     "price": 360,
     "kcal": 400,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000056.jpg"
  },
  {
     "id": 57,
     "name": "オムライス",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 580,
     "kcal": 800,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000057.jpg"
  },
  {
     "id": 58,
     "name": "親子丼",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 580,
     "kcal": 700,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000058.jpg"
  },
  {
     "id": 59,
     "name": "ペペロンチーノ",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 450,
     "kcal": 390,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000059.jpg"
  },
  {
     "id": 60,
     "name": "ポテトサラダ",
     "dish_type": "sub_dish",
     "category_slug":"vegetable",
     "price": 180,
     "kcal": 290,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000060.jpg"
  },
  {
     "id": 61,
     "name": "キムチラーメン",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 390,
     "kcal": 480,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000061.jpg"
  },
  {
     "id": 62,
     "name": "味噌ラーメン",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 340,
     "kcal": 500,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000062.jpg"
  },
  {
     "id": 63,
     "name": "醤油ラーメン",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 340,
     "kcal": 390,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000063.jpg"
  },
  {
     "id": 64,
     "name": "塩ラーメン",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 340,
     "kcal": 350,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000064.jpg"
  },
  {
     "id": 65,
     "name": "豚骨ラーメン",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 340,
     "kcal": 410,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000065.jpg"
  },
  {
     "id": 66,
     "name": "ご飯",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 120,
     "kcal": 180,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000066.jpg"
  },
  {
     "id": 67,
     "name": "ロコモコ丼",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 580,
     "kcal": 820,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000067.jpg"
  },
  {
     "id": 68,
     "name": "ロールキャベツ",
     "dish_type": "main_dish",
     "category_slug":"vegetable",
     "price": 300,
     "kcal": 360,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000068.jpg"
  },
  {
     "id": 69,
     "name": "ミックスサンド",
     "dish_type": "staple_food",
     "category_slug":"bread",
     "price": 390,
     "kcal": 390,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000069.jpg"
  },
  {
     "id": 70,
     "name": "さんまの塩焼き",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 360,
     "kcal": 400,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000070.jpg"
  },
  {
     "id": 71,
     "name": "さつまいもと舞茸の味噌汁",
     "dish_type": "soup",
     "category_slug":"soup",
     "price": 160,
     "kcal": 170,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000071.jpg"
  },
  {
     "id": 72,
     "name": "ソースカツ丼",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 580,
     "kcal": 670,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000072.jpg"
  },
  {
     "id": 73,
     "name": "ソーセージ丼",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 500,
     "kcal": 590,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000073.jpg"
  },
  {
     "id": 74,
     "name": "ウインナソーセージ",
     "dish_type": "main_dish",
     "category_slug":"meat",
     "price": 320,
     "kcal": 350,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000074.jpg"
  },
  {
     "id": 75,
     "name": "鮭と小松菜の味噌汁",
     "dish_type": "soup",
     "category_slug":"soup",
     "price": 220,
     "kcal": 220,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000075.jpg"
  },
  {
     "id": 76,
     "name": "しらすご飯",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 160,
     "kcal": 200,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000076.jpg"
  },
  {
     "id": 77,
     "name": "しじみの味噌汁",
     "dish_type": "soup",
     "category_slug":"soup",
     "price": 160,
     "kcal": 140,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000077.jpg"
  },
  {
     "id": 78,
     "name": "いちごアイスクリーム",
     "dish_type": "sweets",
     "category_slug":"dessert",
     "price": 100,
     "kcal": 90,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000078.jpg"
  },
  {
     "id": 79,
     "name": "酢豚",
     "dish_type": "main_dish",
     "category_slug":"meat",
     "price": 360,
     "kcal": 590,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000079.jpg"
  },
  {
     "id": 80,
     "name": "さつまいもご飯",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 160,
     "kcal": 280,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000080.jpg"
  },
  {
     "id": 81,
     "name": "卵とアスパラガスの味噌汁",
     "dish_type": "soup",
     "category_slug":"soup",
     "price": 220,
     "kcal": 190,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000081.jpg"
  },
  {
     "id": 82,
     "name": "出汁巻き卵",
     "dish_type": "sub_dish",
     "category_slug":"meat",
     "price": 180,
     "kcal": 250,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000082.jpg"
  },
  {
     "id": 83,
     "name": "油揚げと玉ねぎの味噌汁",
     "dish_type": "soup",
     "category_slug":"soup",
     "price": 160,
     "kcal": 180,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000083.jpg"
  },
  {
     "id": 84,
     "name": "たぬきうどん",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 360,
     "kcal": 380,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000084.jpg"
  },
  {
     "id": 85,
     "name": "海老の天ぷら",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 320,
     "kcal": 300,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000085.jpg"
  },
  {
     "id": 86,
     "name": "海老天うどん",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 440,
     "kcal": 460,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000086.jpg"
  },
  {
     "id": 87,
     "name": "天丼",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 580,
     "kcal": 780,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000087.jpg"
  },
  {
     "id": 88,
     "name": "豆腐とわかめの味噌汁",
     "dish_type": "soup",
     "category_slug":"soup",
     "price": 160,
     "kcal": 120,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000088.jpg"
  },
  {
     "id": 89,
     "name": "イタリアントマトサラダ",
     "dish_type": "sub_dish",
     "category_slug":"vegetable",
     "price": 180,
     "kcal": 130,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000089.jpg"
  },
  {
     "id": 90,
     "name": "冷やしトマト",
     "dish_type": "sub_dish",
     "category_slug":"vegetable",
     "price": 120,
     "kcal": 40,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000090.jpg"
  },
  {
     "id": 91,
     "name": "豆苗と冬瓜の味噌汁",
     "dish_type": "soup",
     "category_slug":"soup",
     "price": 160,
     "kcal": 140,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000091.jpg"
  },
  {
     "id": 92,
     "name": "豚汁",
     "dish_type": "soup",
     "category_slug":"soup",
     "price": 220,
     "kcal": 380,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000092.jpg"
  },
  {
     "id": 93,
     "name": "とんかつ",
     "dish_type": "main_dish",
     "category_slug":"meat",
     "price": 380,
     "kcal": 560,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000093.jpg"
  },
  {
     "id": 94,
     "name": "若鶏の唐揚げ",
     "dish_type": "main_dish",
     "category_slug":"meat",
     "price": 380,
     "kcal": 600,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000094.jpg"
  },
  {
     "id": 95,
     "name": "月見うどん",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 440,
     "kcal": 520,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000095.jpg"
  },
  {
     "id": 96,
     "name": "素うどん",
     "dish_type": "staple_food",
     "category_slug":"noodle",
     "price": 280,
     "kcal": 280,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000096.jpg"
  },
  {
     "id": 97,
     "name": "鰻丼",
     "dish_type": "staple_food",
     "category_slug":"rice",
     "price": 680,
     "kcal": 820,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000097.jpg"
  },
  {
     "id": 98,
     "name": "バニラアイスクリーム",
     "dish_type": "sweets",
     "category_slug":"dessert",
     "price": 100,
     "kcal": 90,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000098.jpg"
  },
  {
     "id": 99,
     "name": "焼き海老",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 320,
     "kcal": 210,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000099.jpg"
  },
  {
     "id": 100,
     "name": "焼き牡蠣",
     "dish_type": "main_dish",
     "category_slug":"fish",
     "price": 380,
     "kcal": 340,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000100.jpg"
  },
  {
     "id": 101,
     "name": "チャーシュー",
     "dish_type": "sub_dish",
     "category_slug":"meat",
     "price": 180,
     "kcal": 210,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000101.jpg"
  },
  {
     "id": 102,
     "name": "もも焼き鳥",
     "dish_type": "sub_dish",
     "category_slug":"meat",
     "price": 180,
     "kcal": 270,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000102.jpg"
  },
  {
     "id": 103,
     "name": "ねぎま焼き鳥",
     "dish_type": "sub_dish",
     "category_slug":"meat",
     "price": 180,
     "kcal": 290,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000103.jpg"
  },
  {
     "id": 104,
     "name": "つくね焼き鳥",
     "dish_type": "sub_dish",
     "category_slug":"meat",
     "price": 180,
     "kcal": 310,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000104.jpg"
  },
  {
     "id": 105,
     "name": "五目野菜炒め",
     "dish_type": "main_dish",
     "category_slug":"vegetable",
     "price": 280,
     "kcal": 370,
     "thumbnail": "https://student-cafeteria-application.s3.ap-northeast-1.amazonaws.com/1000000105.jpg"
  }
];
  
module.exports = menu;
