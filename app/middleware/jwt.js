const jwt = require('jsonwebtoken');

module.exports = (option, app) => {
  return async (ctx, next) => {
    const token = ctx.headers.authorization;
    // const token = ctx.request.header.authorization;
    // const method = ctx.method.toLowerCase();
    // console.log('jwt token', token)
    
    if (token) {
      try {
        const jwtInfo = jwt.verify(token, ctx.app.config.jwt.secret);
        // console.log('jwt info', jwtInfo)
        if (!jwtInfo || !jwtInfo.userName) {
          // ctx.throw(401, 'Not Authorization')
          return ctx.body = {
            success: false,
            data: {
              code: 'E005',
              msg: 'Error Token',
            }
          }
        } 
        const user = await ctx.service.api.user.findOne({userName: jwtInfo.userName})
        if (user) {
          await next();
        } else {
          return ctx.body = {
            success: false,
            data: {
              code: 'E005',
              msg: 'Error Token',
            }
          }
        }
      } catch (err) {
        ctx.body = {
          success: false,
          data: {
            code: 'E001',
            msg: 'Something Error',
          }
        }
      }
    } else {
      ctx.body = {
        success: false,
        data: {
          code: 'E005',
          msg: 'Error Token',
        }
      };
      ctx.status = 200;
    }
  }
};