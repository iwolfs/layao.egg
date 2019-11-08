'use strict'

const Controller = require('egg').Controller;

class UserCollector extends Controller {
  async signin() {
    const { ctx } = this;
    await ctx.render('admin/entry/signin.tpl', {});
  }

  
}

module.exports = UserCollector;