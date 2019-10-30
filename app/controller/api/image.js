'use strict';

const Controller = require('egg').Controller;
const fs = require('fs');
const path = require('path');
const pump = require('mz-modules/pump')

const formatNumber = n => {
    n = n.toString();
    return n[1] ? n : `0${n}`;
}

class ImageController extends Controller {
    async upload () {
        const {ctx, service} = this
        // return ctx.body = '{"status":"ok", "msg": "upload success"}'
        const parts = ctx.multipart({autoFields : true})
        const files = []
        try {
            let stream
            while ((stream = await parts()) != null) {
                const filename = stream.filename.toLowerCase();
                const timestamp = Date.now();
                const saveFilename = `${timestamp}_${filename}`;
                const d = new Date();
                const year = d.getFullYear();
                const month = d.getMonth() + 1;
                const day = d.getDate();
                const fileDirName = [year,month,day].map(formatNumber).join('.');
                const fileDir = path.resolve(`app/public/upload/${fileDirName}`);
                if (!fs.existsSync(fileDir)) {
                    const isCreateDir = fs.mkdirSync(fileDir)
                }
                // const target = path.join(this.config.baseDir, 'app/public/img', `${timestamp}_${filename}`)
                const target = path.join(fileDir, saveFilename)
                const writeStream = fs.createWriteStream(target)
                await pump(stream, writeStream)
                files.push({name : filename, url : `/public/upload/${fileDirName}/` + saveFilename})
            }
            // return ctx.body = '{"status":"ok", "msg": "upload success"}'
            const resultData = {
                "status":"ok", 
                "msg": "upload success",
                data: files,
            }
            return ctx.body = JSON.stringify(resultData);

            
            // const _files = await service.images.create(files)
            // return ctx.helper.success(ctx, {files : _files})
        } catch (e) {
            console.log(e)
            return `{"status":"error", "msg": "upload error"}`
            // return ctx.helper.error(ctx, error_001[ 0 ], error_001[ 1 ])
        }
        
    }
}

module.exports = ImageController