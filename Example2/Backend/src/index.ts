// WebアプリケーションフレームワークでExpressを利用する
import express from 'express';
// オリジン間リソース共有(CORS)用のMiddleWareの利用許可をする
import cors from 'cors';
// GraphQLサーバー構築に必要なものを利用する
import { ApolloServer } from 'apollo-server-express';

// GraphQLのSchema定義
import { typeDefs } from './typeDef/schema';
// GraphQLのResolver定義
import { resolvers } from './resolvers';

// ExpressでCORSを利用する
const app = express().use(cors());

// Apolloサーバー実行処理定義
async function startServer() {
	// ApolloServerのインスタンスを定義する
	const apolloServer = new ApolloServer({
  	typeDefs: typeDefs,
    resolvers,
  });
	// ApolloServerを実行する
  await apolloServer.start();
	// Middlewareを適用する
  apolloServer.applyMiddleware({ app, path: '/graphql' });
}

// Apolloサーバーを起動する
startServer();

// Expressサーバーを起動する
app.listen({ port: 4000 }, () => {
  console.log('🚀 Server ready at http://localhost:4000/graphql');
});
