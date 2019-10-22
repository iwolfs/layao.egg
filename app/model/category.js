module.exports = app => {
  const mongoose = app.mongoose;
  const Schema = mongoose.Schema;

  const CategorySchema = new Schema({
    _id: {
      type: Number,
    },
    name: {
      type: String,
      require: true,
    },
    status: {
      type: Number,
      enum: [1, 2], //1 正常， 2 关闭
      default: 1
    },
    createAt: {
      type: Number,
      default: Date.now
    },
    updateAt: {
      type: Number,
    },
    deleteAt: {
      type: Number
    }
  }, {versionKey: false});

  return mongoose.model('Category', CategorySchema, 'category');
}