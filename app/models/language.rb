class Language < ActiveRecord::Base
  belongs_to :group, :class_name => LanguageGroup

  def source_filename
    self[:source_filename] || "program"
  end

  def processes
    self[:processes]==0 ? true : self[:processes]
  end

  def exe_filename
    if compiled
      "program#{self.exe_extension}"
    else
       "#{source_filename}#{self.extension}"
    end
  end

  def compile_command parameters = {}
    parameters.assert_valid_keys(:source, :output)
    parameters.fetch(:source)
    parameters.reverse_merge! :source_dir => File.dirname(parameters[:source])
    parameters.reverse_merge! :output => 'a.out'
    parameters.merge! explode_path_to_hash(:compiler, compiler)
    sprintf(compiler_command, parameters)
  end

  # compiles source to output in box
  def compile box, source, output, options = {}
    result = {}
    box.tmpfile([source_filename, self.extension]) do |source_file|
      box.fopen(source_file, 'w') { |f| f.write(source) }
      result['command'] = self.compile_command(:source => source_file, :output => output)
      result.merge!(Hash[%w[output log box meta stat].zip(box.capture5("/bin/bash -c #{result['command'].shellescape}", options.reverse_merge(:processes => true)))])
      result['stat'] = result['stat'].exitstatus
    end
    return result
  end

  def run_command source = exe_filename
    if interpreted
      sprintf(interpreter_command, explode_path_to_hash(:interpreter, interpreter).merge(:source => source))
    else
      "./#{source}"
    end
  end

  def explode_path_to_hash key, path
    elements = path.split(';')
    {key => path}.merge Hash[(0...elements.size).map{|i|"#{key}[#{i}]".to_sym}.zip(elements)]
  end

  # def self.submission_options
  #   latest = LanguageGroup.where(identifier: %w[c++ c python haskell java ruby j]).pluck(:current_language_id)
  #   old = Language.where(identifier: %w[c++03]).pluck(:id)
  #   languages = Language.where(:id => latest).order(:identifier) + Language.where(:id => old).order(:identifier)
  #   Hash[languages.map{ |language| ["#{language.group.name} (#{language.name})", language.id] }]
  # end

  def self.current_submission_options
    # order here is the display order
    current_identifiers = ["c++", "c", "csharp", "python", "java", "haskell", "ruby", "j"]
    current_langs = current_identifiers.map { |ident|
      current_id = LanguageGroup.where(identifier: ident).pluck(:current_language_id)
      current_lang = Language.where(:id => current_id)[0]
      [current_lang.name, current_lang.id]
    }
    Hash[current_langs]
  end

  def self.other_submission_options
    # will be ordered alphabetically
    other_varients = ["c++14", "c++11", "c99", "python2"]
    other_langs = other_varients.map { |vari|
      current_lang = Language.where(:identifier => vari)[0]
      [current_lang.name, current_lang.id]
    }
    other_langs.sort_by {|ele| ele[0]}
    Hash[other_langs]
  end

  # for validating submissions
  def self.all_submission_options
    current_submission_options + other_submission_options
  end

  # for the selection drop down
  def self.all_grouped_submission_options
    {
      "Current" => current_submission_options,
      "Other" => other_submission_options
    }
  end

  def self.default
    Language.where(identifier: %w[c++17]).first.id
  end

  def self.infer(ext)
    case ext
    when *%w[.cpp]
      LanguageGroup.where(identifier: 'c++').first.current_language
    when *%w[.c]
      LanguageGroup.where(identifier: 'c').first.current_language
    when *%w[.py]
      LanguageGroup.where(identifier: 'python').first.current_language
    else
      nil
    end
  end
end
