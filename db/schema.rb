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

ActiveRecord::Schema.define(version: 20170626024034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "fecha",            null: false
    t.integer  "goles_local"
    t.integer  "goles_visita"
    t.boolean  "penales"
    t.integer  "penales_local"
    t.integer  "penales_visita"
    t.integer  "equipo_local_id",  null: false
    t.integer  "equipo_visita_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "tournament_id"
    t.string   "status_match"
    t.index ["equipo_local_id"], name: "index_matches_on_equipo_local_id", using: :btree
    t.index ["equipo_visita_id"], name: "index_matches_on_equipo_visita_id", using: :btree
    t.index ["tournament_id"], name: "index_matches_on_tournament_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "nombre",      null: false
    t.string   "apellido",    null: false
    t.string   "pais",        null: false
    t.integer  "edad"
    t.integer  "dorsal"
    t.integer  "goles"
    t.integer  "asistencias"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "team_id"
    t.index ["team_id"], name: "index_players_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "nombre",              null: false
    t.string   "pais",                null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_teams_on_user_id", using: :btree
  end

  create_table "teams_tournaments", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "team_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["team_id"], name: "index_teams_tournaments_on_team_id", using: :btree
    t.index ["tournament_id"], name: "index_teams_tournaments_on_tournament_id", using: :btree
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "nombre",             null: false
    t.integer  "tipo",               null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.boolean  "partidos_generados"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string   "estado"
    t.index ["user_id"], name: "index_tournaments_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "token"
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

  add_foreign_key "matches", "tournaments"
  add_foreign_key "players", "teams", on_delete: :cascade
  add_foreign_key "teams", "users"
  add_foreign_key "teams_tournaments", "teams", on_delete: :cascade
  add_foreign_key "teams_tournaments", "tournaments", on_delete: :cascade
  add_foreign_key "tournaments", "users"
end
