// GraphQLサーバー構築に必要なものを利用する
import { gql } from 'apollo-server-express';

// Query＆Mutationに関する定義を記載する
export const typeDefs = gql`
  type Query {
    getNews: [News]
  }

  type News {
    id: ID
    title: String!
    date: String!
    genre: String!
  }
`;
