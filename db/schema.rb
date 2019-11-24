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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_23_060715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aeronaves", force: :cascade do |t|
    t.integer "modelo"
    t.integer "capacidade"
    t.integer "prefixo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aeroportos", force: :cascade do |t|
    t.integer "nome"
    t.integer "sigla"
    t.integer "cidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assento_voos", force: :cascade do |t|
    t.bigint "voo_id"
    t.bigint "assento_id"
    t.bigint "passageiro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assento_id"], name: "index_assento_voos_on_assento_id"
    t.index ["passageiro_id"], name: "index_assento_voos_on_passageiro_id"
    t.index ["voo_id"], name: "index_assento_voos_on_voo_id"
  end

  create_table "assentos", force: :cascade do |t|
    t.integer "cod_assento"
    t.bigint "aeronave_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aeronave_id"], name: "index_assentos_on_aeronave_id"
  end

  create_table "passageiros", force: :cascade do |t|
    t.string "nome_completo"
    t.string "cpf"
    t.string "idade"
    t.string "cod_reserva"
    t.bigint "voo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["voo_id"], name: "index_passageiros_on_voo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "voos", force: :cascade do |t|
    t.integer "numero"
    t.integer "qtd_escalas"
    t.integer "origem"
    t.integer "destino"
    t.date "data_saida"
    t.bigint "aeronave_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aeronave_id"], name: "index_voos_on_aeronave_id"
  end

  add_foreign_key "assento_voos", "assentos"
  add_foreign_key "assento_voos", "passageiros"
  add_foreign_key "assento_voos", "voos"
  add_foreign_key "assentos", "aeronaves", column: "aeronave_id"
  add_foreign_key "passageiros", "voos"
  add_foreign_key "voos", "aeronaves", column: "aeronave_id"
end