'use strict';

const jwt = () => {
  return async (ctx, next) => {

      await next();

  }
}

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);
  router.get('/case', controller.case.list);
  router.get('/about', controller.about.index);
  router.get('/contact', controller.contact.list);
  router.get('/news', controller.news.list);

  router.get('/admin/', controller.admin.home.index);
  router.get('/admin/product', controller.admin.product.index);
  router.get('/admin/product/edit', controller.admin.product.edit);
  router.get('/admin/product/edit/:_id', controller.admin.product.edit);
  router.get('/admin/category', controller.admin.category.index);
  router.get('/admin/category/edit', controller.admin.category.edit);
  router.get('/admin/category/edit/:_id', controller.admin.category.edit);
  


  router.get('/api/counter', controller.api.counter.index);
  router.get('/api/counter/add', controller.api.counter.add);
  router.get('/api/counter/update', controller.api.counter.update);
  router.get('/api/counter/delete', controller.api.counter.delete);

  router.get('/api/category', controller.api.category.index);
  router.post('/api/category', controller.api.category.create);
  router.put('/api/category/:_id', controller.api.category.update);
  router.get('/api/article', controller.api.article.index);
  router.get('/api/article/:_id', controller.api.article.getArticle);
  router.post('/api/article', controller.api.article.create);
  router.put('/api/article/:_id', controller.api.article.update);
  router.post('/api/upload', controller.api.image.upload);
};
