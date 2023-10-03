// WebアプリケーションフレームワークでExpressを利用する
import express from 'express';
// Origin間リソース共有(CORS)用のMiddleWareの利用許可をする
import cors from 'cors';
// GraphQLサーバー構築に必要なものを利用する
import { ApolloServer } from 'apollo-server-express';

// GraphQLのSchema定義
import { typeDefs } from './typeDef/schema';
// GraphQLのResolver定義
import { resolvers } from './resolvers';

// 利用するデータに関連する処理
import { news } from './dataDef/news';
import { menu } from './dataDef/menu';

// ExpressでCORSを利用する
const app = express().use(cors());

// Apolloサーバー実行処理定義
async function startServer() {
	// ApolloServerのインスタンスを定義する
	const apolloServer = new ApolloServer({
  	typeDefs: typeDefs,
    resolvers,
		context: () => {
			return {
				news: news,
				menu: menu
			};
		}
  });
	// ApolloServerを実行する
  await apolloServer.start();
	// Middlewareを適用する
  apolloServer.applyMiddleware({ app, path: '/graphql' });
}

// Apolloサーバーを起動する
startServer();

// Port番号の指定
const port = 4000;

// Expressサーバーを起動する
app.listen({ port: port }, () => {
  console.log(`🚀 Server is running at http://localhost:${port}/graphql`);
});
