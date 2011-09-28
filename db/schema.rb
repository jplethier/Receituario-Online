# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110927042824) do

  create_table "balconista", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "farmaceuticos", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "farmacia", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicos", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "orm",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receita", :force => true do |t|
    t.date     "dataCriacao",     :null => false
    t.string   "descricao"
    t.integer  "medico_id",       :null => false
    t.integer  "paciente_id",     :null => false
    t.integer  "farmacia_id"
    t.date     "dataAtendimento"
    t.integer  "farmaceutico_id"
    t.integer  "balconista_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome",       :null => false
    t.string   "cpf_cnpj",   :null => false
    t.string   "senha",      :null => false
    t.string   "email",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
