// Query定義一覧を記載する
export const query = {
  // Contextから渡されたNews一覧データをGraphQLで返却するための処理
  getNews: (parent: any, args: any, context: any) => {
    let result = context.news;
    return result;
  }
};