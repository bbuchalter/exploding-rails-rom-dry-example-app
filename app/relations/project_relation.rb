class ProjectRelation < ROM::Relation[:sql]
  gateway :default

  schema(:projects, infer: true)

  def all
    select(:id, :name).order(:id)
  end

  def by_id(id)
    projects.by_pk(id).one!
  end
end
