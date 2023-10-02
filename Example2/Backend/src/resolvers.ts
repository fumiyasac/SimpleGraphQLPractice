// Query処理
import { query } from './resolverDef/query';
// Mutation処理
import { mutation } from './resolverDef/mutation';

// Resolver定義一覧
export const resolvers = {
  Query: query,
  // TODO: Mutationに関する処理を定義する
  //Mutation: mutation
};