## [Mockup](https://dribbble.com/shots/19846532-Productivity-Mobile-App)

## Page
- Scaffold
  - appBar: AppBarWidget(Custom)
  - body: 
    - Column
      - Padding
        - TextField
      - Padding
        - Column
          - MenuWidget
          - Row
            - Expanded
              - RoutineCardWidget
            - Expanded
              - RoutineCardWidget
      - Padding
        - MenuWidget
      - Column/ListView/ListView.builder/ListView.separated
        - TaskCardWidget
  - bottomNavigationBar:
    - BottomNavigationBar: 
      - type: BottomNavigationBarType.fixed
      - items:
        - BottomNavigationItem
        - BottomNavigationItem
        - BottomNavigationItem
        - BottomNavigationItem

--- 

## AppBar 
### Modo 1
- AppBar(Widget)
  - title:
    - Row
      - Image.network
      - Column
        - Text
        - Text
  - actions: []
    - IconButton
    - IconButton

### Modo 2
- Row
  - Image.network
  - Expanded
    - Column
      - Text
      - Text
  - IconButton
  - IconButton

--- 


## MenuWidget 
### Modo 1
- Row - mainAxisAlignment = spaceBetween
  - Text - Grande
  - Text

### Modo 2
- Row
  - Expanded
    - Text 
  - Text


### Modo 3
- Row
  - Text - Grande
  - Spacer
  - Text

--- 

## RoutineCardWidget
- Card
  - Column
    - Card/Container
      - Image.network
    - Text
    - Divider
    - Row
      - Text
      - Text
    - PercentBarWidget

--- 
## PercentBarWidget
### Modo 1
- ClipRRect - Corta em curva
  - LinearProgressIndicator

### Modo 2
- Stack - z-index
  - Container - cinza
  - Container - laranja

--- 
## TaskCardWidget
- Row
  - Card/Container
    - Icon
  - Expanded
    - Text
  - Text
