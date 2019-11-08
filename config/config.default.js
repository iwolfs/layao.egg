/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1566257428568_1063';

  // add view config
  config.view = {
    defaultViewEngine: 'nunjucks',
    mapping: {
      '.tpl': 'nunjucks',
    },
  };

  // config.nunjucks = {
  //   此处不安全，建议用 {{ htmlStr | safe}} 代替
  //   autoescape: false
  // };

  config.mongoose = {
    client: {
      url: 'mongodb://127.0.0.1:27017/layao',
      options: {},
      // plugins: [],
    }
  };

  config.jwt = {
    secret: 'egg-api-jwt',
  };

  // add your middleware config here
  config.middleware = [
    // 'jwt', // 加上后会对所有路由进行拦截验证
  ];

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };

  return {
    ...config,
    ...userConfig,
  };
};
