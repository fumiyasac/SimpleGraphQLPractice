[ING] - Apollo 0.x系と1.x系の差分調査用リポジトリ

## 1. 概要

Apolloを利用したGraphQLでの処理において、0.x系と1.x系で大きな変更があったので、相違点がある部分を中心にまとめたものになります。

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

TBD

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
