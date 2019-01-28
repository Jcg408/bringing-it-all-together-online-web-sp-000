class Dog
  attr_accessor :name, :breed
  attr_reader :id
  
  def initialize(id: nil, name: , breed: )
    @id = id
    @name = name
    @breed = breed
  end
  
  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS dogs(
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT)
    SQL
    
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL
    DROP TABLE IF EXISTS dogs
    SQL
    
    DB[:conn].execute(sql)
  end
  
<<<<<<< HEAD
  def self.create(name:, breed:)
    dog = self.new(name: name, breed: breed)
    dog.save
    dog
  end
  
  def self.new_from_db(row)
    new_dog = self.new(id: row[0], name: row[1], breed: row[2])
    new_dog.save
    new_dog
  end
  
  def self.find_by_id (id)
=======
  def self.create(hash)
  new_dog = self.new(hash)
  new_dog
  end
  
  def self.new_from_db(row)
    new_dog = self.new(row[0], row[1], row[2])
    new_dog
  end
  
def self.find_by_id(id)
>>>>>>> cbadf9e1e114bf92f65978573e5f551f9679b464
    sql = <<-SQL
    SELECT * FROM dogs 
    WHERE id = ?
    SQL

    info = DB[:conn].execute(sql, id)[0]
<<<<<<< HEAD
    self.new(id: info[0], name: info[1], breed: info[2])
  end
  
  
  def self.find_by_name (name)
    sql = <<-SQL
    SELECT * FROM dogs 
    WHERE name = ?
    SQL

    info = DB[:conn].execute(sql, name)[0]
    self.new(id: info[0], name: info[1], breed: info[2])
  end
  
  
  def self.find_or_create_by (name:, breed:)
    dog = DB[:conn].execute("SELECT * FROM dogs WHERE name = ? AND breed = ?", name, breed)
    
    if !dog.empty?
      dog_info = dog[0]
      dog = Dog.new(id: dog_info[0], name: dog_info[1], breed: dog_info[2])
    else
      dog = self.create(name: name, breed: breed)
    end
    dog
  end 
  
  
=======
    
    Dog.new(info[0], info[1], info[2])
  end
 
  
  
 
>>>>>>> cbadf9e1e114bf92f65978573e5f551f9679b464
  def save
    if self.id 
      self.update
    else
      sql = <<-SQL
<<<<<<< HEAD
      INSERT INTO dogs (name, breed) 
      VALUES (?, ?)
=======
        INSERT INTO dogs (name, breed) 
        VALUES (?, ?)
>>>>>>> cbadf9e1e114bf92f65978573e5f551f9679b464
      SQL
 
      DB[:conn].execute(sql, self.name, self.breed)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end
    self
  end
  
<<<<<<< HEAD
  
=======
>>>>>>> cbadf9e1e114bf92f65978573e5f551f9679b464
  def update
    sql = <<-SQL
    UPDATE dogs
    SET name = ?,
    breed = ?
    WHERE id = ?
    SQL
<<<<<<< HEAD
    DB[:conn].execute(sql, self.name, self.breed, self.id)
  end
=======
    
   DB[:conn].execute(sql, self.name, self.breed, self.id)
  end
  
  

>>>>>>> cbadf9e1e114bf92f65978573e5f551f9679b464
end