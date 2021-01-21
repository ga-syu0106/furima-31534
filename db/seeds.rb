if Category.all.length == 0
categories = [{category_name:"レディース"},{category_name:"メンズ"},{category_name:"ベビー・キッズ"},{category_name:"インテリア・住まい・小物"},{category_name:"本・音楽・ゲーム"},{category_name:"おもちゃ・ホビー・グッズ"},{category_name:"家電・スマホ・カメラ"},{category_name:"スポーツ・レジャー"},{category_name:"ハンドメイド"},{category_name:"その他"}]
Category.import categories
end

if State.all.length == 0 
  states = [{state_name:"新品、未使用"},{state_name:"未使用に近い"},{state_name:"目立った傷や汚れなし"},{state_name:"やや傷や汚れあり"},{state_name:"傷や汚れあり"},{state_name:"全体的に状態が悪い"},]
  State.import states
end

if DeliveryFree.all.length == 0
  delivery_frees = [{delivery_free_name:"着払い(購入者負担)"},{delivery_free_name:"送料込み(出品者負担)"}]
  DeliveryFree.import delivery_frees
end