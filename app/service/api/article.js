const Service = require('egg').Service;

class ArticleService extends Service {

  async find(params) {
    let { pageIndex, pageSize, channel, ...query } = {...params};
    pageIndex = pageIndex ? Number(pageIndex) : 1;
    pageSize = pageSize ? Number(pageSize) : 10;
    let condition = {...query};
    if (Number(channel)) {
      const categories = await this.ctx.model.Category.find({type: channel});
      const categoryIds = categories.map(item => item._id);
      condition = { ...query, category: {$in: categoryIds} };
      // console.log('pageIndex', pageIndex, categoryIds)
    }
    const total = await this.ctx.model.Article.countDocuments(condition);
    const list = await this.ctx.model.Article.find(condition)
      .skip((pageIndex - 1) * pageSize)
      .limit(pageSize)
      .sort({publishAt: -1, createAt: -1});
    return {total, pageIndex, pageSize, list};
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