module.exports = app => {
  const mongoose = app.mongoose;
  const Schema = mongoose.Schema;

  const CitySchema = new Schema({
    _id: {
      type: Number,
    },
    id: {
      type: Number,
    },
    city: {
      type: String,
      require: true,
    },
    initial: {
      type: String,
    },
    short: {
      type: String,
    },
    code: {
      type: String,
    }
  }, {versionKey: false});

  return mongoose.model('City', CitySchema, 'city');
}