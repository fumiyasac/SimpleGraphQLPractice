// GraphQLサーバー構築に必要なものを利用する
import { gql } from 'apollo-server-express';

// Query＆Mutationに関する定義を記載する
export const typeDefs = gql`
  type Query {
    getNews: [News!]
    getMenus(menuFilter: MenuFilter): [Menu!]
  }

  type Mutation {
    addInquire(inquireItem: InquireItem): Inquire!
  }

  type News {
    id: ID!
    title: String!
    date: String!
    genre: String!
  }

  input MenuFilter {
    dishType: String
    categorySlug: String
  }

  type Menu {
    id: ID!
    name: String!
    dishType: String!
    categorySlug: String!
    price: Int!
    kcal: Int!
    thumbnail: String!
  }

  input InquireItem {
    title: String!
    purpose: String!
    text: String!
  }

  type Inquire {
    id: ID!
    title: String!
    purpose: String!
    text: String!
  }
`;
