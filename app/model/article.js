module.exports = app => {
  const mongoose = app.mongoose;
  const Schema = mongoose.Schema;

  const ArticleSchema = new Schema({
    _id: {
      type: Number,
    },
    title: {
      type: String,
      require: true,
    },
    summary: {
      type: String,
    },
    cover: {
      type: String,
    },
    content: {
      type: String,
    },
    category: {
      type: Number,
      ref: 'Category',
      require: true,
    },
    views: {
      type: Number,
      default: 0,
    },
    status: {
      type: Number,
      enum: [1, 2, 3], // 1 草稿，2 发布，3 关闭
    },
    createAt: {
      type: Number,
      default: Date.now,
    },
    updateAt: {
      type: Number
    },
    deleteAt: {
      type: Number
    }
  }, {versionKey: false});

  return mongoose.model('Article', ArticleSchema, 'article');
}