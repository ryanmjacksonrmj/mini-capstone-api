Supplier.create!([
  {name: "Harper-Collins", email: "hc@test.com", phone_number: "123-456-7890"},
  {name: "Macmillan Publishers", email: "mm@test.com", phone_number: "222-222-2222"},
  {name: "Penguin Random House", email: "prh@test.com", phone_number: "333-333-3333"}
])
Product.create!([
  {name: "Pride and Prejudice", price: "898.0", description: "When Elizabeth Bennet first meets eligible bachelor Fitzwilliam Darcy, she thinks him arrogant and conceited; he is indifferent to her good looks and lively mind. When she later discovers that Darcy has involved himself in the troubled relationship between his friend Bingley and her beloved sister Jane, she is determined to dislike him more than ever.", inventory: 1, supplier_id: 2},
  {name: "The Count of Monte Cristo (Penguin Classics)", price: "1111.0", description: "Thrown in prison for a crime he has not committed, Edmond Dantes is confined to the grim fortress of If. There he learns of a great hoard of treasure hidden on the Isle of Monte Cristo and he becomes determined not only to escape, but also to unearth the treasure and use it to plot the destruction of the three men responsible for his incarceration.", inventory: 1, supplier_id: 2},
  {name: "The Count of Monte Cristo (Penguin Classics)", price: "1039.0", description: "Thrown in prison for a crime he has not committed, Edmond Dantes is confined to the grim fortress of If. There he learns of a great hoard of treasure hidden on the Isle of Monte Cristo and he becomes determined not only to escape, but also to unearth the treasure and use it to plot the destruction of the three men responsible for his incarceration.", inventory: 1, supplier_id: 3},
  {name: "Confessions", price: "899.0", description: "Designed to show the details of the soul’s progress, from enjoyment of the beauties outside itself to a study of its own nature and finally to joy in the knowledge of God, ‘Confessions’ was the first work in literature to be concerned entirely with an introspective analysis of the author’s own spiritual and emotional experiences.", inventory: 1, supplier_id: 3},
  {name: "Don Quixote (Penguin Classics)", price: "2599.0", description: "Don Quixote has become so entranced reading tales of chivalry that he decides to turn knight errant himself. In the company of his faithful squire, Sancho Panza, these exploits blossom in all sorts of wonderful ways. While Quixote's fancy often leads him astray—he tilts at windmills, imagining them to be giants—Sancho acquires cunning and a certain sagacity.", inventory: 1, supplier_id: 3},
  {name: "Confessions", price: "799.0", description: "Designed to show the details of the soul’s progress, from enjoyment of the beauties outside itself to a study of its own nature and finally to joy in the knowledge of God, ‘Confessions’ was the first work in literature to be concerned entirely with an introspective analysis of the author’s own spiritual and emotional experiences.", inventory: 1, supplier_id: 1},
  {name: "Jane Eyre", price: "1039.0", description: "Thrown in prison for a crime he has not committed, Edmond Dantes is confined to the grim fortress of If. There he learns of a great hoard of treasure hidden on the Isle of Monte Cristo and he becomes determined not only to escape, but also to unearth the treasure and use it to plot the destruction of the three men responsible for his incarceration.", inventory: 1, supplier_id: 1},
  {name: "Dracula", price: "5.95", description: "\"When Jonathan Harker visits Transylvania to help Count Dracula with the purchase of a London house, he makes a series of horrific discoveries about his client.\"", inventory: nil, supplier_id: 3}
])
Image.create!([
  {url: "https://m.media-amazon.com/images/I/81rHDxooaVL._SL1500_.jpg", product_id: 1},
  {url: "https://m.media-amazon.com/images/I/51LRMVVrewL.jpg", product_id: 3},
  {url: "https://m.media-amazon.com/images/I/51LRMVVrewL.jpg", product_id: 5},
  {url: "https://m.media-amazon.com/images/I/81rHDxooaVL._SL1500_.jpg", product_id: 2},
  {url: "https://m.media-amazon.com/images/I/81rHDxooaVL._SL1500_.jpg", product_id: 4},
  {url: "https://m.media-amazon.com/images/I/81rHDxooaVL._SL1500_.jpg", product_id: 6},
  {url: "https://m.media-amazon.com/images/I/81rHDxooaVL._SL1500_.jpg", product_id: 7},
  {url: "https://m.media-amazon.com/images/I/41fREmhd4IL.jpg", product_id: 11}
])
