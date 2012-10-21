# encoding: utf-8

require 'fastercsv'

namespace :db do

  namespace :import do

    task :iprc_library do
      puts "Starting import of library items…"
      file_path = Rails.root+'build/newlibrary_databaseexport.csv'
      cols = [
        'Circ Number',
        'Acq Date',
        'Ref Onlu',
        'Label (for printing)',
        'Title',
        'Author/Artists',
        'Publisher/Label',
        'Year of Issue',
        'Format',
        'Contact',
        'Condition',
        'Website',
        'Location',
        'Category',
        'Abstract',
        'Due Date',
        'Borrower Name',
        'Check Out Date',
        'Borrower'
      ]
      unless File.exists?(file_path)
        puts "File not found: #{file_path}"
        exit 1
      end
      arr_of_arrs = FasterCSV.read(file_path)
      puts "Raw count of items: #{arr_of_arrs.length}"
      arr_of_arrs.each do |itary|
        item = Item.new
        puts itary.inspect
        exit 1
      end

    end

    task :iprc_users do



    end

  end
end
