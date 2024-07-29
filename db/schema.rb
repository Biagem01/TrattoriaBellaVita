# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_27_125701) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefono"
    t.text "indirizzo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredienti", force: :cascade do |t|
    t.string "nome"
    t.string "quantita"
    t.string "giacenza"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredienti_ricetta", force: :cascade do |t|
    t.bigint "ricetta_id", null: false
    t.bigint "ingrediente_id", null: false
    t.decimal "quantita"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingrediente_id"], name: "index_ingredienti_ricetta_on_ingrediente_id"
    t.index ["ricetta_id"], name: "index_ingredienti_ricetta_on_ricetta_id"
  end

  create_table "ordine_ricetta", force: :cascade do |t|
    t.bigint "ordine_id", null: false
    t.bigint "ricetta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantita"
    t.index ["ordine_id"], name: "index_ordine_ricetta_on_ordine_id"
    t.index ["ricetta_id"], name: "index_ordine_ricetta_on_ricetta_id"
  end

  create_table "ordines", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_ordines_on_cliente_id"
  end

  create_table "ricetta", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingredienti_ricetta", "ingredienti", column: "ingrediente_id"
  add_foreign_key "ingredienti_ricetta", "ricetta", column: "ricetta_id"
  add_foreign_key "ordine_ricetta", "ordines"
  add_foreign_key "ordine_ricetta", "ricetta", column: "ricetta_id"
  add_foreign_key "ordines", "clientes"
end
