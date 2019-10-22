const Service = require('egg').Service;

class CategoryService extends Service {

  async find() {
    return await this.ctx.model.Category.find();
  }

  async findOne(condition) {
    return await this.ctx.model.Category.findOne(condition);
  }

  async findById(_id) {
    return await this.ctx.model.Category.findById(_id);
  }

  async create(name) {
    const { ctx } = this;
    const _id = await ctx.service.api.counter.getNextSequenceValue('categoryId');
    return await ctx.model.Category.create({_id, name});
  }

  async update(_id, content) {
    return await this.ctx.model.Category.findByIdAndUpdate({_id}, {$set: content});
  }

  async delete(_id) {
    return await this.ctx.model.Category.deleteOne({_id});
  }
}

module.exports = CategoryService;