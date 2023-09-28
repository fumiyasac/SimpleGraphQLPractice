// GraphQLサーバー構築に必要なものを利用する
import { gql } from 'apollo-server-express';

// Query＆Mutationに関する定義を記載する
export const typeDefs = gql`
  type Query {
    me: User
  }

  type User {
    username: String!
  }

  type Mutation {
    me: User
  }
`;
