class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '書籍' },
    { id: 2, name: 'コミック' },
    { id: 3, name: '絵本' },
    { id: 4, name: 'CD' },
    { id: 5, name: 'DVD・Blu-ray' },
    { id: 6, name: 'ゲーム' },
    { id: 7, name: '文房具' },
    { id: 8, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items

end