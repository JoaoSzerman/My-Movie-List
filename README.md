# MyMovieList

MyMovieList é um aplicativo mobile cross-platform (Flutter) para exibir filmes e séries consumindo a API do **The Movie Database (TMDB)**.
Ele traz listas de tendências, Now Playing, Upcoming, Top Rated, Popular, busca, detalhes de cada filme, paginação infinita e testes.

---

## 🔍 Funcionalidades

* **Home**

    * Trending, Now Playing, Upcoming, Top Rated e Popular
    * Scroll infinito (carregamento automático de próximas páginas)
* **Search**

    * Busca por título (com estados: inicial, loading, resultados, sem resultados)
* **Detail**

    * Banner (backdrop) full‑width com gradiente
    * Pôster sobreposto, título, rating
    * Sinopse, gêneros, duração, ano
    * Abas: **About Movie**, **Reviews**, **Cast**
* **WatchList** *(previsto)*

    * Persistência local de favoritos (Hive/SQLite)
* **Navegação & Estado**

    * GetX Routing + Bindings
    * GetX State Management

---

## 🛠 Tecnologias & Bibliotecas

* **Flutter** & **Dart**
* **GetX** (Injeção de Dependências, Roteamento, State Management)
* **Dio** (HTTP client)
* **cached\_network\_image**, **stroke\_text**, **flutter\_test**, **mockito**

---

## 🏗 Arquitetura

```
lib/
├── core/                      # Constantes, theme, widgets compartilhados
│   ├── constants/             # API keys, URLs, etc.
│   ├── theme/                 # Cores, text styles
│   └── widgets/               # AppBar, SearchBar, MovieCard genéricos
├── modules/
│   ├── home/                  # Módulo Home
│   │   ├── data/              # Datasources, models, repositories impl
│   │   ├── domain/            # Entities, Repositories interface, UseCases
│   │   └── presentation/      # Views, Widgets, Controller, Bindings
│   ├── search/                # Módulo Search (similar à home)
│   └── detail/                # Módulo Detail (movie/{id}, reviews, credits)
└── routes/                    # Definição de rotas GetX (AppPages, AppRoutes)
```

Clean Architecture (Data → Domain → Presentation) garante alto desacoplamento e testabilidade.

---

## 🚀 Como rodar localmente

1. Clone o repositório
2. Obtenha sua chave TMDB em [https://www.themoviedb.org/](https://www.themoviedb.org/) e configure em `lib/app/core/constants/api_constants.dart`:

   ```dart
   const String TMDB_API_KEY = 'SUA_API_KEY';
   ```
3. Execute:

   ```bash
   flutter pub get
   flutter run
   ```

---

## 📝 Roadmap & Pendências

* **Auto‑complete** na Search Bar (sugestões a partir de 3 caracteres).
* **Skeleton loading** em cada tela (placeholders).
* **WatchList** persistido com Hive ou SQLite.
* **Cobertura de testes** mais ampla (DetailController, integração, offline).
* **Tratamento de erros** (UI para falhas de rede, estados offline, timeouts).
* **Tema** e melhor ajuste de cores e textos

---

## ✅ Testes

Para rodar todos os testes automatizados:

```bash
flutter test
```

Atualmente temos:

* 2 Widget tests
* 2 Unit tests (Controller e UseCase)
* 1 Model test

---

## 📄 Licença & Créditos

* API consumida: [The Movie Database (TMDB)](https://developers.themoviedb.org)
* Arquitetura baseada em Clean Architecture + GetX.
* UI design inspirado em “Movies App Community” do Figma:
  https://www.figma.com/design/sGeEQgvzxNUoQEXD8rvudc/Movies-app--Community-?node-id=0-1&p=f&t=BzZmNIKMyfpImoTy-0



---

*Desenvolvido com ❤️ por João Szerman*
