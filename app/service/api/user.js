'use strict'

const Service = require('egg').Service;

class UserService extends Service {
  async find(condition) {
    return await this.ctx.model.User.find(condition);
  }
  
  async create(content) {
    const { ctx } = this;
    const _id = await ctx.service.api.counter.getNextSequenceValue('userId');
    return await ctx.model.User.create({_id, ...content});
  }

  async findOne(condition) {
    return await this.ctx.model.User.findOne(condition);
  }
}

module.exports = UserService;