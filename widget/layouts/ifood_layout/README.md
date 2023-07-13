# ifood_layout


Scaffold
  appBar - prop
    AppBar - Custom
      title - prop
        Row
          Text
          Icon
      actions - prop
        IconButton
        IconButton
      bottom - prop
        TabBar - Custom
          tabs - prop
            Text[]
  body - prop
    TabBarView
      children - prop
        InitPage
        RestaurantesPage
        ...

InitPage
  Column
    GridView.builder
      Column
        Card
          Image.network
        Text
