const Service = require('egg').Service;

class ArticleService extends Service {

  async find() {
    return await this.ctx.model.Article.find();
  }

  async findOne(condition) {
    return await this.ctx.model.Article.findOne(condition).populate('category', 'name');
  }

  async findById(_id) {
    return await this.ctx.model.Article.findById(_id)
    .populate('category', 'name createAt')
  }

  async create(content) {
    const { ctx } = this;
    const _id = await ctx.service.api.counter.getNextSequenceValue('articleId');
    return await ctx.model.Article.create({_id, ...content});
  }

  async update(_id, content) {
    return await this.ctx.model.Article.findByIdAndUpdate({_id}, {$set: content});
  }

  async delete(_id) {
    return await this.ctx.model.Article.deleteOne({_id});
  }
}

module.exports = ArticleService;