require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
  include Singleton
  def initialize
      super('questions.db')
      self.type_translation = true
      self.results_as_hash = true
  end
end

class Question
  attr_accessor :id, :title, :body, :user_id
  
  def self.find_by_id(id)
      questions = QuestionsDBConnection.instance.execute(<<-SQL, id)
        SELECT * FROM questions WHERE id = ?
      SQL
      raise 'not in database' if questions.empty? 
      Question.new(questions.first)
  end
  
  def self.find_by_author_id(user_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
        SELECT * FROM questions WHERE user_id = ?
    SQL
    raise 'user has no questions' if questions.empty?

    questions.map { |quest| Question.new(quest) }
  end

  def initialize(input)
      @id = input['id']
      @title = input['title']
      @body = input['body']
      @user_id = input['user_id']
  end

end

class Reply
  attr_accessor :id, :question_id, :parent_reply_id, :body_reply, :user_id
  
  def self.find_by_id(id)
      input = QuestionsDBConnection.instance.execute(<<-SQL, id)
        SELECT * FROM replies WHERE id = ?
      SQL

      raise 'not in database' if input.empty? 
      Reply.new(input.first)
  end

  def self.find_by_user_id(user_id)
    input = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
        SELECT * FROM replies WHERE user_id = ?
    SQL

    raise 'not found' if input.empty?
    input.map { |reply| Reply.new(reply)}
  end

  def self.find_by_question_id(question_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
        SELECT * FROM replies WHERE question_id = ? 
    SQL

    raise 'not found' if questions.empty?
    questions.map { |question| Reply.new(question) }
  end

  def initialize(input)
    @id = input['id']
    @question_id = input['question_id']
    @parent_reply_id = input['parent_reply_id']
    @body_reply = input['body_reply']
    @user_id = input['user_id']
  end
end

class User
  attr_accessor :fname, :lname, :id

  def self.find_by_name(fname, lname)
      names = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
        SELECT * FROM users WHERE fname = ? AND lname = ?
      SQL

      raise 'not in database' if names.empty? 
      User.new(names.first)
  end

  def self.find_by_user_id(id)
      input = QuestionsDBConnection.instance.execute(<<-SQL, id)
        SELECT * FROM users WHERE id = ?
      SQL

      raise 'user not found' if input.empty?
      User.new(input.first)
  end

  def initialize(input)
    @fname = input['fname']
    @lname = input['lname']
    @id = input['id']
  end
end

class QuestionFollow
  attr_accessor :id, :question_id, :user_id
  
  def self.find_by_id(id)
    input = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT * FROM questions_follows WHERE id = ?
    SQL
    raise 'not in database' if input.empty? 

    QuestionFollow.new(input.first)
  end

  def initialize(input)
    @id = input['id']
    @question_id = input['question_id']
    @user_id = input['user_id']
  end
end


class QuestionLike
    attr_accessor :id, :question_id, :user_id
    
    def self.find_by_id(id)
        input = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT * FROM question_likes WHERE id = ?
        SQL
        raise 'not in database' if input.empty? 

        QuestionLike.new(input.first)
    end

    def initialize(input)
        @id = input['id']
        @question_id = input['quetion_id']
        @user_id = input['user_id']
    end
end