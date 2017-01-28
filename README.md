# Boost Camp iOS Development Project 2 : MemeMe App 2.0
* 작성자 : 서석인 (Applus 조)
* 제작기간 : Jan 15 ~ Jan 28
* 시연 동영상 링크 : https://youtu.be/EokaBUgdY4k

## Objective
* 사용자로부터 사진을 입력받은 후 이미지 상하단에 텍스트를 추가하여 Meme 이라고 지칭하는 새로운 Object를 생성한다.
* 생성한 Meme을 Activity View를 통해서 공유하거나 저장할 수 있도록 한다.
* 위에서 생성한 Meme의 목록을 Table View, Collection View를 통해 볼 수 있도록 UI를 설계한다.
* 각각의 View에 생성된 Meme들은 공유되어야 하며, 해당 Cell을 눌렀을 때 Detail View를 통해 이미지를 볼 수 있어야 한다.

## Kick
* 생성된 Meme 들 중 마음에 드는 Meme을 골라서 나중에 따로 볼 수 있도록 Bookmark 기능을 구현한다.
* Detail View에서 Bookmark 버튼을 누르면 해당 Meme이 Bookmark 리스트에 없는 경우 Bookmark 리스트에 들어가고, Bookmark 리스트에 있는 경우 Bookmark 리스트에서 제거한다.

## Issue History
- [x] 텍스트를 눌렀을때 키보드 크기만큼 View Frame Shift (Jan 20 Fix)
- [x] Top Text를 수정할때는 View Frame을 이동하지 않게 하기 (Jan 21 Fix)
- [x] Table View, Collection View 추가 (Jan 24 Fix)
- [x] 이미지 사이즈 정리 (Jan 26 Fix)
- [x] 카메라 기능 추가 (Jan 26 Fix)
- [x] 글자입력후 엔터 눌렀을때 키보드 사라지게 하기 (Jan 27 Fix)
- [x] 글자 폰트 조정 (가운데 투명안하게) (Jan 27 FIx)
- [x] Activity 기능 추가 (Jan 27 Fix)
- [x] Kick 추가 : -> Favorite 기능 추가! (Jan 28 Added)
