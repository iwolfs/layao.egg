'use strict';

const Controller = require('egg').Controller;
const { Channel } = require('../common/enums');


class CaseController extends Controller {
  // async list() {
  //   const { ctx } = this;
  //   // ctx.body = 'hi, egg';
  //   const dataSource = await ctx.service.home.index();
  //   await ctx.render('case/list.tpl', {navs: dataSource.NavDataSource, cases: dataSource.CaseDataSource});
  // }

  async list() {
    const { ctx } = this;
    const params = {channel: Channel.CASE}
    const dataSource = await ctx.service.api.article.find(params);
    await ctx.render('case/list.tpl', {cases: dataSource});
  }

  async getCase() {
    const { ctx } = this;
    const _id = ctx.params._id;
    const caseDetail = await ctx.service.api.article.findOne({_id})
    await ctx.render('case/detail.tpl', {caseDetail});
  }
}

module.exports = CaseController;
