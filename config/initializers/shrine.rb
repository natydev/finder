# frozen_string_literal: true

require 'shrine'

if Rails.env.development?
  require 'shrine/storage/file_system'
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
    store: Shrine::Storage::FileSystem.new('public', prefix: "uploads_#{Rails.env}") # permanent
  }
elsif Rails.env.test?
  require 'shrine/storage/memory'
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
else
  require 'shrine/storage/s3'
  s3_options = {
    access_key_id: ENV['AWS_S3_ID'],
    secret_access_key: ENV['AWS_S3_SECRET'],
    region: ENV['AWS_S3_REGION'],
    bucket: ENV['AWS_S3_BUCKET']
  }
  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)
  }
end

Shrine.plugin :activerecord # or :sequel
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :derivatives
Shrine.plugin :validation_helpers
Shrine.plugin :pretty_location
