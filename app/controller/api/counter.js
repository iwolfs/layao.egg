'use strict';

const Controller = require('egg').Controller;

class CounterController extends Controller {
  async index() {
    const { ctx } = this;
    return ctx.body = await ctx.service.api.counter.find();
  }
  
  async getNext() {
    const { ctx } = this;
    const res = await ctx.service.api.counter.getNextSequenceValue('userId');
    return ctx.body = 'api user' + res;
  }

  async add() {
    const { ctx } = this;
    const name = ctx.query.name;
    const result = await ctx.service.api.counter.addSequence(name);
    return ctx.body = result;
  }

  async update() {
    const { ctx } = this;
    const name = ctx.query.name;
    return ctx.body = await ctx.service.api.counter.updateSequence(name);
  }

  async delete() {
    const { ctx } = this;
    const name = ctx.query.name;
    return ctx.body = await ctx.service.api.counter.deleteSequence(name);
  }
}

module.exports = CounterController;