class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'すべて'},
    { id: 3, name: 'メンズ'},
    { id: 4, name: 'レディース'},
    { id: 5, name: 'ベビー、キッズ'},
    { id: 6, name: 'インテリア、住まい、小物'},
    { id: 7, name: '本、音楽、ゲーム'},
    { id: 8, name: 'おもちゃ、ホビー、グッズ'},
    { id: 9, name: 'コスメ、香水、美容'},
    { id: 10, name: '家電、スマホ、カメラ'},
    { id: 11, name: 'スポーツ、レジャー'},
    { id: 12, name: 'ハンドメイド'},
    { id: 13, name: 'チケット'},
    { id: 14, name: '自転車、オートバイ'},
    { id: 15, name: 'その他'},
  ]
end
