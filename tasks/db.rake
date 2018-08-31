# frozen_string_literal: true

namespace :db do
  desc "Reset database"
  task :reset do
    Rake::Task["db:drop"].execute
    Rake::Task["db:create"].execute
    Rake::Task["db:migrate"].execute
  end

  task :soft_reset do
    Sequel.connect(Settings.database_url) do |_db|
      puts "Drop project table"
    end
    Rake::Task["db:migrate"].execute
  end

  desc "Create database"
  task :create do
    uri = URI(Settings.database_url)
    uri.path = ""
    clean_uri = uri.to_s

    Sequel.connect(clean_uri) do |db|
      puts "Create database"
      db.execute "CREATE DATABASE spider"
    end
  end

  desc "Drop database"
  task :drop do
    Sequel.connect(Settings.database_url) do |db|
      puts "Drop database"
      db.execute "DROP DATABASE IF EXISTS spider"
    end
  end

  def migrations?
    file_pattern = File.join(ROOT_PATH, "db", "migrations", "*.rb")
    Dir[file_pattern].any?
  end

  def run_sequel_migrations(db, schema_migrations_table_name, db_migrations_path, version = nil)
    version = Integer(version) unless version.nil?

    Sequel::Migrator.run(db, db_migrations_path, table: schema_migrations_table_name, target: version) if migrations?
  end

  desc "Run migrations"
  task :migrate, [:version] do |_t, args|
    schema_migrations_table_name = "schema_migrations"

    Sequel.extension :migration
    db = Sequel.connect(Settings.database_url)
    run_sequel_migrations(db, schema_migrations_table_name, "db/migrations", args[:version])
  end
end
