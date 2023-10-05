// Query定義一覧を記載する
export const query = {

  // ① News一覧を取得する
  getNews: (parent: any, args: any, context: any) => {
    // Contextから渡されたNews一覧データをGraphQLで返却するための処理
    const result = context.news;
    return result;
  },

  // ② Menu一覧を取得する
  getMenus: (parent: any, args: any, context: any) => {
    // Contextから渡されたMenu一覧データを条件でフィルタリングをしGraphQLで返却するための処理
    const { menuFilter } = args;
    // inputで送られた`dishType`の値に該当するものを絞り込む(※ない場合は全件表示)
    const resultOfDishTypeFilter = context.menu.filter((menu: any) => {
      if (menuFilter.dishType === null || menuFilter.dishType === undefined) {
        return true
      } else {
        return menu.dishType === menuFilter.dishType
      }
    });
    // inputで送られた`categorySlug`の値に該当するものを絞り込む(※ない場合は全件表示)
    const resultOfCategorySlugFilter = context.menu.filter((menu: any) => {
      if (menuFilter.categorySlug === null || menuFilter.categorySlug === undefined) {
        return true
      } else {
        return menu.categorySlug === menuFilter.categorySlug
      }
    });
    // 2つの絞り込み結果から共通要素を取得する
    const duplicatedResult = [...resultOfDishTypeFilter, ...resultOfCategorySlugFilter].filter((menu: any) => {
        return resultOfDishTypeFilter.includes(menu) && resultOfCategorySlugFilter.includes(menu)
    });
    const result = [...new Set(duplicatedResult)];
    return result;
  },
};