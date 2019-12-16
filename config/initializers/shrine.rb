require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/memory"

Shrine.storages = { 
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary 
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads_#{Rails.env}"),       # permanent 
}
 
Shrine.plugin :activerecord # or :sequel 
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays 
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file 
Shrine.plugin :derivatives
Shrine.plugin :validation_helpers
Shrine.plugin :pretty_location

if Rails.env.test?
  Shrine.storages = { 
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
end