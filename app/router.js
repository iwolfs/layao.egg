'use strict';



/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  const jwt = app.middleware.jwt();
  const userAuth = app.middleware.userAuth();
  
  router.get('/', controller.home.index);
  router.get('/case', controller.case.list);
  router.get('/about', controller.about.index);
  router.get('/contact', controller.contact.list);
  router.get('/news', controller.news.list);

  router.get('/admin/signin', controller.admin.user.signin);
  router.get('/admin/', userAuth, controller.admin.home.index);
  router.get('/admin/product', userAuth, controller.admin.product.index);
  router.get('/admin/product/edit', userAuth, controller.admin.product.edit);
  router.get('/admin/product/edit/:_id', userAuth, controller.admin.product.edit);
  router.get('/admin/category', userAuth, controller.admin.category.index);
  router.get('/admin/category/edit', userAuth, controller.admin.category.edit);
  router.get('/admin/category/edit/:_id', userAuth, controller.admin.category.edit);
  


  // router.get('/api/counter', controller.api.counter.index);
  // router.get('/api/counter/add', controller.api.counter.add);
  // router.get('/api/counter/update', controller.api.counter.update);
  // router.get('/api/counter/delete', controller.api.counter.delete);

  router.get('/api/category', jwt, controller.api.category.index);
  router.post('/api/category', jwt, controller.api.category.create);
  router.put('/api/category/:_id', jwt, controller.api.category.update);
  router.get('/api/article', controller.api.article.index);
  router.get('/api/article/:_id', controller.api.article.getArticle);
  router.post('/api/article', jwt, controller.api.article.create);
  router.put('/api/article/:_id', jwt, controller.api.article.update);
  router.get('/api/user', controller.api.user.getUsers);
  // router.get('/api/user/add', controller.api.user.create);
  router.post('/api/user/signin', controller.api.user.signin);
  router.post('/api/upload', jwt, controller.api.file.upload);
};
