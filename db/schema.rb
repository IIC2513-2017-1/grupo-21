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

ActiveRecord::Schema.define(version: 20170430052236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.datetime "fecha"
    t.integer  "goles_local"
    t.integer  "goles_visita"
    t.boolean  "penales"
    t.integer  "penales_local"
    t.integer  "penales_visita"
    t.integer  "equipo_local_id"
    t.integer  "equipo_visita_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "tournament_id"
    t.index ["equipo_local_id"], name: "index_matches_on_equipo_local_id", using: :btree
    t.index ["equipo_visita_id"], name: "index_matches_on_equipo_visita_id", using: :btree
    t.index ["tournament_id"], name: "index_matches_on_tournament_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "pais"
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
    t.string   "nombre"
    t.string   "pais"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "nombre"
    t.integer  "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "tournaments"
  add_foreign_key "players", "teams"
  add_foreign_key "teams_tournaments", "teams"
  add_foreign_key "teams_tournaments", "tournaments"
end
