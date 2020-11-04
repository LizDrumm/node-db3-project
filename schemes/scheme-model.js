// scheme-model
const db = require("../data/db-config.js");

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find(){
    return db('schemes')
}

function findById(id){
    return db('schemes')
    .where({id})
    .first()
}

function findSteps(id){
    return db('schemes')
    .join('steps','steps.scheme_id', 'schemes.id')
    .select(
        'step.id',
        'schemes.scheme_name',
        'steps.step_number',
        'steps.instructions'
    )
    .where({'schemes:id':id})
    .orderBy('steps.step_number')
}


function add(scheme){
    return db('schemes')
    .insert(scheme)
    .then((id) => {
        return db('schemes')
    .where({ id: id }).first()
    })
    .catch((err) => {
        return null
    })
}

function update (update,id){
    db("scheme")
    .where({ id })
    .update(changes)
    .then((scheme) => {
      if (scheme) {
        return findById(id);
      } else {
        return null;
      }
    })
    .catch((err) => {
      return null;
    });
  }

function remove (id){
    return db("schemes").where({ id }).del();   
}