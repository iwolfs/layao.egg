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

  // config.mongoose = {
  //   client: {
  //     url: 'mongodb://127.0.0.1:27017/layao',
  //     options: {},
  //     // plugins: [],
  //   }
  // };

  // add your middleware config here
  config.middleware = [];

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };

  return {
    ...config,
    ...userConfig,
  };
};
