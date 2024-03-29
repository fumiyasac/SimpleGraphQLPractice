[ING] - Apollo 0.x系と1.x系の差分調査用リポジトリ

## 1. 概要

Apolloを利用したGraphQLでの処理において、0.x系と1.x系で大きな変更があったので、相違点がある部分を中心にまとめたものになります。

※こちらの内容に関しては、2023年10月17日に開催された「Mobile勉強会 Wantedly × チームラボ #11」でも登壇しました。登壇資料内では、業務内で得られた知見や簡単なサンプル開発を通じて得られた学びの中で「基本のき」の部分も合わせてまとめています。

- [Apollo iOS v1.x系の変更でインパクトがある点をおさらいする](https://speakerdeck.com/fumiyasac0921/apollo-ios-v1-dot-xxi-nobian-geng-deinpakutogaarudian-woosaraisuru)

## 2. 過去バージョン(0.x系)でのコード自動生成手順の確認

コード自動生成処理に関連する部分は抜本的に変更が入っていました。2023年9月時点での最新版はv1.5であることや、6月中にv0.x系からバージョンアップされた際の変更内容がかなり破壊的であったので、今後の動向や変更内容に関しては引き続きキャッチアップを継続していきます。

まず前段として、0.x系での導入手順とBuildまでの流れを軽く触れておきます。

__【まとめ図解】__

過去バージョンでは、XcodeをBuildするタイミングでGraphQLのコード生成処理を実行する様な形を取っていました。

![v0.x系でApolloを導入する際のポイント図解](https://github.com/fumiyasac/SimpleGraphQLPractice/blob/main/images/apollo_v0_guidance.png)

## 3. 最新バージョン(1.x系)での重要ポイント

Apolloのメジャーバージョンアップが実施された事に伴い、CLI関連をはじめ内部機能についても破壊的な変更がされました。

- [Introduction to Apollo iOS](https://www.apollographql.com/docs/ios/)

その中でも、以前にApolloのv0.x系を過去に導入していた場合からv1.x系にバージョンアップをする際は下記のマイグレーションガイドに沿って実施していく事になります。特にCLI関連やコード自動生成処理についても抜本的な変更がされている点に注意が必要です。

- [Apollo iOS 1.0 migration guide](https://www.apollographql.com/docs/ios/migrations/1.0)

※ Apolloマイグレーションガイドについては「v1.0→v1.2」&「v1.2→v1.3」に関するドキュメントも用意されています。

__【CLIに関する変更点】__

v1.x系では、Swift Package Manager経由でApolloを導入してApolloを導入した場合にはXcodeからCLIツールをインストールする事ができます。これまでのnode.js経由でのインストール方式ではなくXcodeを経由したインストールとなったので、設定も随分としやすくなっています。

![v1.x系でのCLIインストール手順](https://github.com/fumiyasac/SimpleGraphQLPractice/blob/main/images/apollo_v1_cli_install.png)

__【コード自動生成に関するコマンド】__

```shell
# ①`apollo-codegen-config.json`の雛形を作成する
$ ./apollo-ios-cli init --schema-namespace CountriesSchema --module-type embeddedInTarget --target-name SimpleGraphQLPractice (--overwrite)

# ② apollo-codegen-config.jsonの内容をProjectに合わせて記載する

# ③ schema定義ファイル(schema.json)をapollo-ios-cli経由でダウンロード or 直接ダウンロードしProject内に配置
# ※ schema定義ファイルが正しく設定されている場合は下記コマンドを実行してダウンロードができます
$ ./apollo-ios-cli fetch-schema

# ④ 定義した`apollo-codegen-config.json`からSwiftコードを自動生成する
$ ./apollo-ios-cli generate
```

下図は今回のサンプルプロジェクトで記載している`apollo-codegen-config.json`の一例になりますが、内容には現在お使いのProject構成に合わせて設定することになります。

![v1.x系でのコード自動生成処理に関する設定](https://github.com/fumiyasac/SimpleGraphQLPractice/blob/main/images/apollo_v1_configuration.png)

__【コード自動生成処理後に関する】__

下図は今回のサンプルプロジェクト(Example2)で自動生成したコードの概要になります。

![v1.x系でのコード自動生成された関する項目](https://github.com/fumiyasac/SimpleGraphQLPractice/blob/main/images/apollo_v1_auto_generated.png)

## 4. 簡単な実装サンプルの解説

サンプルの構成はオーソドックスな構成をベースに考えて、View要素と関係する処理については`@Published private(set) var (※変数名)`で定義した変数との双方向Bindingの様な形を前提として処理を組み立てています。

![収録サンプルで利用しているアーキテクチャ](https://github.com/fumiyasac/SimpleGraphQLPractice/blob/main/images/example_mobile_architecture.png)

__【GraphQL側の処理をasync/awaitで取り扱う】__

```swift
// 実装の参考:
// 「apollo-ios」内のIssue内のディスカッションで紹介されていたコードを参考にしています。
// Apollo内で用意されているQuery & Mutationの実行処理をasync/awaitでラッピングしている。
// https://github.com/apollographql/apollo-ios/issues/2216

// MARK: - ApolloClient Extension

extension ApolloClient {

    // GraphQLのQueryをする処理をasync/awaitの処理内で実行する
    @discardableResult
    func fetchAsync<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        contextIdentifier: UUID? = nil,
        queue: DispatchQueue = .main
    ) async throws -> GraphQLResult<Query.Data> {

        // MEMO: withCheckedThrowingContinuationでErrorをthrowする形にしています。
        return try await withCheckedThrowingContinuation { continuation in
            fetch(
                query: query,
                cachePolicy: cachePolicy,
                contextIdentifier: contextIdentifier,
                queue: queue
            ) { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    // GraphQLのMutationをする処理をasync/awaitの処理内で実行する
    @discardableResult
    func performAsync<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool = true,
        queue: DispatchQueue = .main
    ) async throws -> GraphQLResult<Mutation.Data> {

        // MEMO: withCheckedThrowingContinuationでErrorをthrowする形にしています。
        return try await withCheckedThrowingContinuation { continuation in
            perform(
                mutation: mutation,
                publishResultToStore: publishResultToStore,
                queue: queue
            ) { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
```

__【Example1】__

国情報一覧表示→詳細表示をするだけのシンプルなものになります。

![収録サンプルで利用しているアーキテクチャ](https://github.com/fumiyasac/SimpleGraphQLPractice/blob/main/images/country_graphql_server.png)

- GraphQL Server:<br>https://countries.trevorblades.com/graphql

国一覧画面 | 国詳細画面
:--: | :--:
<img src="images/example1_country_list_screen.png" width="300" /> | <img src="images/example1_country_detail_screen.png" width="300" />

__【Example2】__

お料理メニュー一覧表示→絞り込み検索やお問い合わせ送信をするだけのシンプルなものになります。

- GraphQL Server:<br>http://localhost:4000/graphql<br>※ ローカル環境で起動して確認をする様にしてください。  

```shell
# package.jsonに記載している内容をインストールする
$ yarn

# GraphQL Serverを起動する
$ yarn dev
```

メニュー検索画面 | お知らせ一覧画面
:--: | :--:
<img src="images/example2_menu_list_screen.png" width="300" /> | <img src="images/example2_news_list_screen.png" width="300" />

お問い合わせ画面 | お問い合わせ入力状態
:--: | :--:
<img src="images/example2_inquire_default_screen.png" width="300" /> | <img src="images/example2_inquire_input_screen.png" width="300" />

## 参考1. 見比べ時の資料

v0.x系での実装については、下記講座を受講した際に紹介されていたものを参考にして、当リポジトリで紹介している2種類のサンプルコードはそれを参考にした上で1.x系利用した実装へ置き換えたものになります。

- [GraphQL with iOS and SwiftUI: The Complete Developers Guide](https://www.udemy.com/course/graphql-in-ios-using-swift/) 

## 参考2. GraphQLサーバーの新規作成

このサンプルでは「Apollo + Express」を利用した環境で動作する、疑似的なGraphQLサーバーから値を取得する形を取っています。
下記の様な手順で環境構築を実施しました。

```shell
# Backendディレクトリ内に疑似的なサーバーに関するコードを作成する
$ cd Backend

# プロジェクトの新規作成
$ yarn init -y

# Apollo Serverパッケージを追加する（Apollo + Express構成）
$ yarn add apollo-server apollo-server-express express graphql cors

# Typescriptパッケージを追加する
$ yarn add -D typescript @types/node

# tsconfig.jsonを新規作成する
$ npx tsc --init

# ts-node＆ts-node-devパッケージを新規作成する（TypeScriptコード変更を検知し再起動するため）
$ yarn add -D ts-node ts-node-dev

# 参考1: Apollo+Expressで始めるGraphQL超入門 ~ GraphQLをざっくり理解する
# https://qiita.com/Zonoma/items/5de4b14dcd839db5f148
# 参考2: TypeScriptでApollo-Serverを構築する
# https://qiita.com/omukaik/items/4b31b771c674fcea9118
# 参考3: 【GraphQL】Apollo ServerやTypeScriptを使ってGraphQLのAPIを開発する
# https://isub.co.jp/graphql/getting-started-with-apollo-server/
```

__【GraphQLそのものについて理解を深める参考資料】__

- [GraphQLはどんな時に使うか](https://speakerdeck.com/saboyutaka/graphqlhadonnashi-nishi-uka)

__【環境構築手順の参考資料】__

- [GraphQL Apollo-Server ハンズオン](https://suzukalight.com/blog/posts/2019-12-08-graphql-server)

__【Apollo Serverを利用したGraphQLサーバーの参考資料】__

- [Node.js＆TypeScriptでGraphQL入門：Apollo Server（V4）を使って簡単にAPIを実装](https://go-tech.blog/nodejs/ts-graphql/)
- [Apollo Server with TypeScrip](https://zenn.dev/intercept6/articles/3daca0298d32d8022e71)
- [GraphQLのページネーション機能を実装する方法: Apollo client + express-graphql](https://sterfield.co.jp/blog/17617/)

※ 今回はPagination機能は実装していませんが、機会があれば挑戦してみたいと感じています。
