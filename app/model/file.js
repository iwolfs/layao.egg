module.exports = app => {
  const mongoose = app.mongoose;
  const Schema = mongoose.Schema;

  const FileSchema = new Schema({
    _id: {
      type: Number,
    },
    fileName: {
      type: String,
    },
    url: {
      type: String,
    },
    type: {
      type: Number,
      enum: [0, 1, 2], // 0 其他，1 图片，2 视频
      default: 0,
    },
    fileType: {
      type: String,
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

  return mongoose.model('File', FileSchema, 'file');
}