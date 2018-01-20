# fluvies

A basic Flutter app showing:
- Interaction with network (used TMDB api)
- MVP Pattern
- Database implementation by:
    * Caching list of movies for offline access (TODO: Caching Images) 
    * Saving `liked` movies
- Implementation of FutureBuilders
- `factory` constructor pattern of Dart
- Using `pathprovider` for creating and accessing a database file (works in both iOS and Android)
- Screen Transaction animation using `Hero` and `InkWell`

## Demo

![Fluvies_Demo](https://github.com/dilpreet96/Fluvies/blob/master/graphic/demo.gif)

## Setup
1.For installing and setting up [Flutter](https://flutter.io/setup/)

2.You need a **TMDB API Key**for which you can go to this [link](https://developers.themoviedb.org/3/getting-started/introduction).
When you get the key, place it in `network_data.dart`.

## License
```
Copyright 2018 Dilpreet Singh (dilpreet96)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

```
