'use strict';

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
};
