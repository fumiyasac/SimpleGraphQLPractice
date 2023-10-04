// Query処理
import { query } from './resolverDef/query';

// Mutation処理
// ※今回はMutationはないのでコメントアウトしています。
// import { mutation } from './resolverDef/mutation';

// Resolver定義一覧
export const resolvers = {
  Query: query,
  // MEMO: Mutationに関する処理を定義する部分
  //Mutation: mutation
};