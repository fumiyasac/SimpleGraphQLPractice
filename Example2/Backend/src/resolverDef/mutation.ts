// Mutation定義一覧を記載する
export const mutation = {
  addInquire: (parent: any, args: any, context: any) => {
    // Contextから渡されたInquireItemデータをGraphQLで追加するための処理
		// ※こちらは仮の送信処理をする形になります。
    const { inquireItem } = args;
    const newInquire = {
      id: context.inquire.length + 1,
      title: inquireItem.title,
      text: inquireItem.text
    }
    context.inquire.push(newInquire);
    return newInquire;
  }
};
