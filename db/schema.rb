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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180405062600) do

  create_table "compras", force: :cascade do |t|
    t.string   "documento",        limit: 255
    t.integer  "serie",            limit: 4
    t.integer  "numero",           limit: 4
    t.integer  "dia",              limit: 4
    t.integer  "proveedor_id",     limit: 4
    t.decimal  "base",                         precision: 10, scale: 2
    t.decimal  "iva",                          precision: 10, scale: 2
    t.decimal  "bienes",                       precision: 10, scale: 2
    t.decimal  "servicios",                    precision: 10, scale: 2
    t.decimal  "total",                        precision: 10, scale: 2
    t.integer  "libro_compra_id",  limit: 4
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "tipo_de_gasto_id", limit: 4
  end

  add_index "compras", ["libro_compra_id"], name: "index_compras_on_libro_compra_id", using: :btree
  add_index "compras", ["tipo_de_gasto_id"], name: "index_compras_on_tipo_de_gasto_id", using: :btree

  create_table "configs", force: :cascade do |t|
    t.integer  "contribuyente_id",   limit: 4
    t.integer  "establecimiento_id", limit: 4
    t.integer  "mes",                limit: 4
    t.integer  "year",               limit: 4
    t.integer  "usuario_id",         limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "configs", ["usuario_id"], name: "index_configs_on_usuario_id", using: :btree

  create_table "contribuyentes", force: :cascade do |t|
    t.string   "nit",                limit: 255
    t.string   "nombre",             limit: 255
    t.string   "calle",              limit: 255
    t.string   "no_casa",            limit: 255
    t.integer  "zona",               limit: 4
    t.string   "colonia",            limit: 255
    t.string   "departamento",       limit: 255
    t.string   "municipio",          limit: 255
    t.string   "telefono",           limit: 255
    t.integer  "tipo_contribuyente", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "contribuyentes", ["nit"], name: "index_contribuyentes_on_nit", unique: true, using: :btree

  create_table "establecimientos", force: :cascade do |t|
    t.string   "nombre",           limit: 255
    t.string   "telefono",         limit: 255
    t.string   "colonia",          limit: 255
    t.string   "departamento",     limit: 255
    t.string   "municipio",        limit: 255
    t.string   "zona",             limit: 255
    t.string   "calle",            limit: 255
    t.string   "numero_casa",      limit: 255
    t.integer  "contribuyente_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "establecimientos", ["contribuyente_id"], name: "index_establecimientos_on_contribuyente_id", using: :btree

  create_table "libro_compras", force: :cascade do |t|
    t.integer  "establecimiento_id", limit: 4
    t.integer  "mes",                limit: 4
    t.integer  "year",               limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "libro_compras", ["establecimiento_id"], name: "index_libro_compras_on_establecimiento_id", using: :btree

  create_table "libro_ventas", force: :cascade do |t|
    t.integer  "establecimiento_id", limit: 4
    t.integer  "mes",                limit: 4
    t.integer  "year",               limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "libro_ventas", ["establecimiento_id"], name: "index_libro_ventas_on_establecimiento_id", using: :btree

  create_table "proveedors", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "nit",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tipo_de_gastos", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tipo_de_gastos", ["nombre"], name: "index_tipo_de_gastos_on_nombre", unique: true, using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "full_name",              limit: 255, default: "", null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  create_table "venta", force: :cascade do |t|
    t.string   "documento",  limit: 255
    t.string   "serie",      limit: 255
    t.integer  "numero",     limit: 4
    t.integer  "dia",        limit: 4
    t.string   "nit",        limit: 255,                          default: "C/F"
    t.string   "nombre",     limit: 255,                          default: "Clientes Varios"
    t.decimal  "bienes",                 precision: 10, scale: 2
    t.decimal  "servicios",              precision: 10, scale: 2
    t.decimal  "base",                   precision: 10, scale: 2
    t.decimal  "iva",                    precision: 10, scale: 2
    t.decimal  "total",                  precision: 10, scale: 2
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
  end

  create_table "ventas", force: :cascade do |t|
    t.string   "documento",      limit: 255
    t.string   "serie",          limit: 255
    t.integer  "numero",         limit: 4
    t.integer  "dia",            limit: 4
    t.string   "nit",            limit: 255,                          default: "C/F"
    t.string   "nombre",         limit: 255,                          default: "Clientes Varios"
    t.decimal  "bienes",                     precision: 10, scale: 2
    t.decimal  "servicios",                  precision: 10, scale: 2
    t.decimal  "base",                       precision: 10, scale: 2
    t.decimal  "iva",                        precision: 10, scale: 2
    t.decimal  "total",                      precision: 10, scale: 2
    t.datetime "created_at",                                                                      null: false
    t.datetime "updated_at",                                                                      null: false
    t.integer  "libro_venta_id", limit: 4
  end

  add_index "ventas", ["libro_venta_id"], name: "index_ventas_on_libro_venta_id", using: :btree

  add_foreign_key "compras", "libro_compras"
  add_foreign_key "compras", "tipo_de_gastos"
  add_foreign_key "configs", "usuarios"
  add_foreign_key "establecimientos", "contribuyentes"
  add_foreign_key "libro_compras", "establecimientos"
  add_foreign_key "libro_ventas", "establecimientos"
  add_foreign_key "ventas", "libro_ventas"
end
