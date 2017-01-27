class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :products
  belongs_to :group
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:email]

  attr_accessor :group_key
  validate :domain_check
  before_validation :group_key_to_id


  def domain_check
    ##sql文で特定のドメインをget
    sql = "select domain from groups where name='#{group_key}'"
    ##取得したdomainの配列を除去し、string型で取得
    domain = ActiveRecord::Base.connection.select_all(sql).rows.join
    ##取得したstring型のdomainをemailと正規表現でmatch
    unless /#{domain}/ === email
      errors[:base] << "学校のemailを登録してください"
    end
  end

  private

  def group_key_to_id
    group = Group.where(name: group_key).first
    self.group_id = group.id
  end
end
