// WebアプリケーションフレームワークでExpressを利用する
import express from 'express';
// オリジン間リソース共有(CORS)用のMiddleWareの利用許可をする
import cors from 'cors';
// GraphQLサーバー構築に必要なものを利用する
import { ApolloServer, gql } from 'apollo-server-express';

// ExpressでCORSを利用する
const app = express();
app.use(cors());

// GraphQLのSchema定義を記述する
const schema = gql`
  type Query {
    me: User
  }

  type User {
    username: String!
  }
`;

// GraphQLのResolver定義を記述する
const resolvers = {
  Query: {
    me: () => ({ username: 'mkubara' }),
  },
};

async function startServer() {
	// ApolloServerのインスタンスを定義する
	const apolloServer = new ApolloServer({
  	typeDefs: schema,
    resolvers,
  });
	// ApolloServerを実行する
  await apolloServer.start();
	// Middlewareを適用する
  apolloServer.applyMiddleware({ app, path: '/graphql' });
}

// Apolloサーバー＆Expressサーバーを実行する
startServer();
app.listen({ port: 4000 }, () => {
  console.log('🚀 Server ready at http://localhost:4000/graphql');
});
