const { BeanModel } = require("redbean-node/dist/bean-model");

class Tag extends BeanModel {
    toJSON() {
        return {
            id: this._id,
            name: this._name,
        };
    }
}

module.exports = Tag;
